require 'pry'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_admin?, :logged_in?, :current_user

  def is_admin?
    if logged_in?
      current_user.admin
    else
      false
    end
  end

  def current_user
    if logged_in?
      User.find(session[:user_id])
    else
      false
    end
  end

  def logged_in?
    !!session[:user_id]
  end
end