class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def hello
    # redirect_to controller: 'sessions', action: 'new' unless session[:user_id]
  end

end
