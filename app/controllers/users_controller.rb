class UsersController < ApplicationController

  def new
    @user = User.new 
  end #end 

  def create
    @user = User.new(user_params)
    #binding.pry
    if @user.save
      session[:user_id] = @user.id 
      #redirect_to user_url(@user)
      redirect_to user_path(@user)
    else
      render :new
    end
  end #create

  def show
    # if params[:controller]

    # else

    # end 
    if session[:user_id]
      set_user
      render :show
    else
      redirect_to controller: 'welcome', action: 'home'
    end

  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end