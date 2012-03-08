class ItemsCount < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  
  def increment
    self.count += 1
    self.save
  end
  
  def decrement
    self.count -= 1
    self.save 
  end
end
