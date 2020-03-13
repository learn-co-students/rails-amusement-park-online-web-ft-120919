class SessionsController < ApplicationController
  skip_before_action :verify_user, only: [:new, :create]

  def index
  end

  def show
  end

  def new
    @users = User.all
  end

  def create
    user = User.find_by(name: params[:user][:name])
    authenticated = user.try(:authenticate, params[:password])
    if authenticated
      session[:user_id] = authenticated.id
      redirect_to user_path(authenticated)
    else
      redirect_to :signin
    end
  end

  def edit
  end

  def update
  end

  def destroy
    session.clear
    redirect_to :root
  end 
end
