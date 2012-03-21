class User < ActiveRecord::Base
   acts_as_authentic
   
   easy_roles :roles
   
   has_many :orders
   
   validates :login, :length => { :maximum => 30}
   
   def cart
      self.orders.find_or_create_by_status("cart")
   end
   
   
   def blank_address?
     address.blank? && name.blank?
   end
   
   def admin?
     has_role? "admin"
   end
   
   def stuff?
     has_role? "stuff"
   end

  def registered?
     has_role? "registered"
  end
end

