class AttractionsController < ApplicationController

  def index
    @attractions = Attraction.all 
  end #index

  def show
    set_attraction
  end #show

  private

  def set_attraction
    @attraction = Attraction.find_by(id: params[:id])
  end

end #class