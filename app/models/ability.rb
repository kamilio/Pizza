class Ability
  include CanCan::Ability
  
  def get_user
    @user
  end
 
  def guest
    can :create, User
    can :create, UserSession
  end
  
  def registered
    can :manage, UserSession, :user_id => @user.id
    can :manage, User, :id => @user.id
    can :manage, Order, :user_id => @user.id
    cannot :destroy, Order
  end
  
  def stuff
    can :manage, Item
    can :manage, Order
    registered
  end
  
  def admin
    stuff
  end
    

  def initialize(user)
    @user = user || User.new
    admin if @user.admin?
    stuff if @user.stuff?
    if @user.registered?
      registered
    else
      guest 
    end
    
      
    
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
   end
end
