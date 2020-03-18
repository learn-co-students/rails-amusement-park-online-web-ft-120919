class RidesController < ApplicationController

  def create
    ride = Ride.create(
      :user_id => session[:user_id],
      :attraction_id => params[:ride][:attraction_id]
    )
    @message = ride.take_ride
    redirect_to ride.user, flash: {message: @message}
  end

end