class UsersController < ApplicationController 

    def show
        @user = User.find_by(id: params[:id])
        # debugger
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
        # redirect_to '/signin'
       else 
        redirect_to '/'
       end
    end

    def signin
        @user = User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :password, :nausea, :happiness, :tickets, :height, :admin)
    end

end