class Order < ActiveRecord::Base
  has_and_belongs_to_many :items
  
  def inc(item)
  end
  
  def dec(item)
    
  end
end
