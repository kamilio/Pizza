class ItemsCount < ActiveRecord::Base
  belongs_to :order
  belongs_to :item
  
  def increment
    self.count += 1
    self.save
    self
  end
  
  def decrement
    self.count -= 1
    self.save 
    self
  end
end
