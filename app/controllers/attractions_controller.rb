class AttractionsController < ApplicationController
    before_action :admin_check, only: [:new, :create, :edit, :update, :destroy]

    def index
        @attractions = Attraction.all
    end

    def show
        @attraction = Attraction.find(params[:id])
    end

    def ride
        @ride = Ride.create(user_id: current_user.id, attraction_id: params[:id])
        message = @ride.take_ride
        redirect_to user_path(current_user, message: message)
    end

    def new
        @attraction = Attraction.new
    end

    def create
        @attraction = Attraction.new(attraction_params)

        if @attraction.save
            redirect_to attraction_path @attraction
        else
            redirect_to new_attraction_path
        end
    end

    def edit
        @attraction = Attraction.find(params[:id])
    end

    def update
        @attraction = Attraction.find(params[:id])

        if @attraction.update(attraction_params)
            redirect_to attraction_path @attraction
        else
            redirect_to edit_attraction_path @attraction
        end
    end

    def destroy
        Attraction.delete(params[:id])
        redirect_to attractions_path
    end

    private
    def admin_check
        if session[:user_id]
            redirect_to root_path if !User.find(session[:user_id]).admin
        else
            redirect_to root_path
        end
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end