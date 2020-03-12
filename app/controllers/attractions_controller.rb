class AttractionsController < ApplicationController
  before_action :set_attraction_by_id, only: [:show, :edit, :update]
  before_action :set_ride_by_user_id, only: [:show, :edit]

  def index
    @attractions = Attraction.all
  end

  def show
    @ride = @attraction.rides.build(user_id: current_user.id)
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    @attraction.save
    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  private
  
  def attraction_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_rating
    )
  end


  def set_attraction_by_id
    @attraction = Attraction.find_by(id: params[:id])
  end

  def set_ride_by_user_id
    @ride = @attraction.rides.build(user_id: current_user.id)
  end
end