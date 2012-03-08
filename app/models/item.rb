class Item < ActiveRecord::Base
   has_many :items_count
   has_many :orders, :through => :items_count
  
   validates :name, :presence => true
   validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
      :numericality => {:greater_than => 0}
      
end
