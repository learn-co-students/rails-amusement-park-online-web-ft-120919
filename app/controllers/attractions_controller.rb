class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all 
    @user = User.find_by(id: session[:user_id])
  end #index

  def new
    @attraction = Attraction.new
  end #new

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end #create

  def show
    @user = User.find_by(id: session[:user_id])
    set_attraction
  end #show

  def edit
    @attraction = Attraction.find_by(id: params[:id])
  end #edit 

  def update
    set_attraction
    if @attraction.update_attributes(attraction_params)
      redirect_to attraction_path(@attraction)
    else
      render :edit 
    end
  end #update

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end #class