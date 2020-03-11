class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(name: params[:user][:name])
    #binding.pry 
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to user_url(@user)
    else
      #redirect_to 'root'
      redirect_to controller: 'sessions', action: 'new'
    end

  end

  def destroy
    session.delete :user_id
  end

end 