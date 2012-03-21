class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items_counts
  has_many :items, :through => :items_counts
  
  # From cart to home
  :cart; :ordered; :accepted; :ready; :travelling; :delivered
  
  
  def add_item(item)
    get_or_create_items_count(item).increment
  end
  
  def remove_item(item)
    count = get_or_create_items_count(item)
    count.decrement if count.count != 0
  end
  
  # Item count
  def get_count_for_item(item)
    get_or_create_items_count(item).count
  end
  
  # Sum for one order
  def sum
    sum = 0
    self.items_counts.all.each { |count| sum += count.count*count.item.price }
    return sum 
  end
  
  def change_status(status)
    self.status = status
    self.save
  end
  
  private
  def get_or_create_items_count(item)
    self.items << item unless get_items_count(item)
    return get_items_count(item)
  end
  
  def get_items_count(item)
    self.items_counts.find_by_item_id(item.id)
  end
end
