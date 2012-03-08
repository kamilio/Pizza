class User < ActiveRecord::Base
   acts_as_authentic
   
   has_many :orders
   
   def cart
      self.orders.find_or_create_by_status("cart")
   end

   private
end

