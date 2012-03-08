class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items_counts
  has_many :items, :through => :items_counts
  
  def to_s
    output = "ORDER" + self.status + " " + self.user.login
  end
  
  def get_count_for_item(item)
  end
  
  def add_item(item)
    if get_items_count(item)
      get_items_count(item).increment
    else
      self.items_counts.create(:order => self, :item => item)
    end
  end
  
  def remove_item(item)
    count = get_items_count(item)
    count.decrement if count && count.count != 0
  end
  
  def get_count_for_item(item)
    return get_items_count(item).count if get_items_count(item) 
      0
  end
  
  def sum
    sum = 0
    self.items_counts.all.each do |count|
      sum += count.count*count.item.price
    end
    sum 
  end
  
  private
  def get_items_count(item)
    self.items_counts.find_by_item_id(item.id)
  end
end
