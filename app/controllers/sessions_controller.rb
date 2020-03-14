class SessionsController < ApplicationController
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(name: params[:user][:name])

        if @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to signin_path
        end
    end

    def destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def session_params
        params.require(:user).permit(:name, :password)
    end
end