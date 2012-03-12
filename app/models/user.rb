class User < ActiveRecord::Base
   acts_as_authentic
   
   easy_roles :roles
   
   has_many :orders
   
   def cart
      self.orders.find_or_create_by_status("cart")
   end
   
   def address?
     defined?(self.addresss) && defined?(self.name)
   end

   private
end

