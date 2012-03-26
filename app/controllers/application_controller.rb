class ApplicationController < ActionController::Base
  check_authorization  
  protect_from_forgery
  
  helper_method :current_user_session, :current_user

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = UserSession.find
    end

    def current_user
      User.current = @current_user if defined?(@current_user)
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end

    def require_user
      unless current_user
        flash[:notice] = "You must be logged in to access this page"
        redirect_to login_path
        return false
      end
    end

    def require_no_user
      if current_user
        flash[:notice] = "You must be logged out to access this page"
        redirect_to root_path
        return false
      end
    end
    
    def require_address
      if current_user.blank_address?
        flash[:notice] = "Fill the address and full name"
        redirect_to edit_user_path(current_user)
      end
    end
    
    rescue_from CanCan::AccessDenied do |exception|
      #abort("Not allowed #{current_user.to_s} #{current_user.roles.inspect} Access denied on #{exception.action} #{exception.subject.inspect}" )
      flash[:error] = "Access denied on module on #{exception.action} #{exception.subject.inspect} for #{current_user.to_s}"
      redirect_to login_path
    end
end
