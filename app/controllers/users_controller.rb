class UsersController < ApplicationController 

    def show
        # debugger
        # @user = User.find_by(id: params[:id])
        if request.post?
            @ride = Ride.create(user_id: session[:user_id], attraction_id: params[:id] )
        else
            if session[:user_id]
                @user = User.find_by(id: params[:id])
                render '/users/show'
            else
                redirect_to '/'
            end
        end
        
    end

    def new
        @user = User.new 
    end

    def create
       if user_params
        @user = User.create(user_params)
        session[:user_id] = @user.id
        # debugger
        redirect_to user_path(@user)
       else 
        redirect_to '/'
       end
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end