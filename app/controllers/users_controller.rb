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
    #binding.pry 
    #if params[:controller] == "attractions" #got here via post request
    if request.post?  
      @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id] )
      flash[:message] = @ride.take_ride
      @user = User.find_by(id: session[:user_id])

      if flash[:message] == true
        flash[:message] = "Thanks for riding the #{Attraction.find_by(id: params[:id]).name}!"
        #binding.pry 
        redirect_to user_path(@user)
      else
        redirect_to user_path(@user)
      end
    else #got here via get request
      if session[:user_id]
        set_user
        render :show
      else
        redirect_to controller: 'welcome', action: 'home'
      end
    end #get request/post request
  end #show

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
  end

end