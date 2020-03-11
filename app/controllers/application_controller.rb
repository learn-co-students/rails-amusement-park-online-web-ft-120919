class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user, :require_login
  helper_method :current_user, :logged_in?, :admin_only

  def logged_in?
  	!!session[:user_id]
  end

  def current_user
  	@current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_login
    return redirect_to root_path unless logged_in?
  end
  

  def admin_only
    unless current_user.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to user_path(current_user)
    end
  end
end
