class Item < ActiveRecord::Base
   has_and_belongs_to_many :orders
  
   validates :name, :presence => true
   validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
      :numericality => {:greater_than => 0}
end
