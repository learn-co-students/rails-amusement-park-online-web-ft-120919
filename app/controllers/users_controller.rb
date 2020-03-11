class UsersController < ApplicationController 

    def new
        @user = User.new 
    end

    # def create
    #     if params[:name] && params[:name] != ""
    #       session[:name] = params[:name]
    #       redirect_to '/'
    #     else
    #       redirect_to '/login'
    #     end
    # end

    def create
        @user = User.create(user_params)
        # debugger
        redirect_to user_path(@user)
    end

    def show
        @user = User.find(params[:id])
    end
    
    private

    def user_params
        params.require(:user).permit(:name, :password_digest, :nausea, :happiness, :tickets, :height, :admin)
    end

    

end