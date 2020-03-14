class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new
        end
    end

    def show
        @message = params[:message] if params[:message]
        if !logged_in?
            redirect_to root_path
        else
            @user = current_user
        end
    end

    def index
        @users = User.all
    end

    private
    
    def user_params
        params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
    end

end