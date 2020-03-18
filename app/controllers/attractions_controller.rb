class AttractionsController < ApplicationController
  
  def new
    @user = User.find(session[:user_id])
    @attr = Attraction.new
  end

  def create
    @user = User.find(session[:user_id])
    @attr = Attraction.new(attraction_params)
    @attr.save
    redirect_to attraction_path(@attr)
  end

  def index
    @user = User.find(session[:user_id])
    @attrs = Attraction.all
  end

  def show
    @user = User.find(session[:user_id])
    @attr = Attraction.find(params[:id])
    @ride = @attr.rides.build(user_id: session[:user_id])
  end

  def edit
    @user = User.find(session[:user_id])
    @attr = Attraction.find(params[:id])
  end

  def update
    @user = User.find(session[:user_id])
    @attr = Attraction.find(params[:id])
    @attr.update(attraction_params)
    redirect_to attraction_path(@attr)
  end

  private

  def attraction_params
    params.require(:attraction).permit(
      :name,
      :min_height,
      :tickets,
      :happiness_rating,
      :nausea_ratiing
    )
  end

end