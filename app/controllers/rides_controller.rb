class RidesController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def create
    @ride = Ride.create(ride_params)
    @msg = @ride.take_ride
    redirect_to user_path(@ride.user), flash: { message: @msg }
  end

  def edit
  end

  def update
  end

  def destroy
  end 

  private

  def ride_params
    params.require(:ride).permit(:user_id, :attraction_id)
  end
end
