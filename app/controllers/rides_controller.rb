class RidesController < ApplicationController 

    def create
        @ride = Ride.create(ride_params)
        @message = @ride.take_ride
        #debugger
        redirect_to user_path(@ride.user), flash: {msg: @message}
    end

    private

    def ride_params
        params.require(:ride).permit(:attraction_id, :user_id)
    end
end