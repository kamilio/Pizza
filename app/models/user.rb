class User < ActiveRecord::Base
   acts_as_authentic
   
   easy_roles :roles
   
   has_many :orders
   
   def cart
      self.orders.find_or_create_by_status("cart")
   end
   
   def has_address?
     defined?(address) && defined?(name)
   end

   private
end

