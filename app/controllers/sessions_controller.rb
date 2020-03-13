class SessionsController < ApplicationController
    def new
        # login from here
        @user = User.new
    end

    def create
        @user = User.new(signin_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def destroy

    end

    private

        def signin_params
            params.require(:user).permit(:name, :password)
        end
end