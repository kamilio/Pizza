class Item < ActiveRecord::Base
   validates :name, :presence => true
   validates :price, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, 
      :numericality => {:greater_than => 0}
end
