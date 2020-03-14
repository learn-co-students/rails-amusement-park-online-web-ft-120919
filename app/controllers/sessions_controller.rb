class SessionsController < ApplicationController
    def new
        # login from here
        
    end

    def create
        @user = User.find_by(name: signin_params[:user_name])
        # byebug
        if @user.authenticate(signin_params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.destroy
        redirect_to root_path
    end

    private

        def signin_params
            params.permit(:user_name, :password)
        end
end