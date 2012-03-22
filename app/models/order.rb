require "state_machine"
class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items_counts
  has_many :items, :through => :items_counts
  
  # From cart to home
  #:cart; :ordered; :accepted; :ready; :travelling; :delivered
  
  state_machine :status, :initial => :cart do
    event :order do
      transition :cart => :ordered
    end
    
    event :cancel do
      transition :cart => :cart
    end
    
    event :accept do
      transition :ordered => :accepted
    end
    
    event :finish do
      transition :accepted => :ready
    end
    
    event :refuse do
      transition :ordered => :refused
    end
    
    event :take do 
      transition :ready => :taken
    end
    
    event :deliver do
      transition :taken => :delivered
    end
  end
  
  def has_items?
    self.items.each do |item| 
      return true if get_items_count(item).count > 1 
    end
    return false
  end
  
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
