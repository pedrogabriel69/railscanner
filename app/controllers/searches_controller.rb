class SearchesController < ApplicationController

  def create
    @initial_station = RailwayStation.find(params[:initial_station])
    @final_station = RailwayStation.find(params[:final_station])
    @routes = (@initial_station.routes & @final_station.routes).compact.uniq
    render :show
  end

  def show
    @routes = [nil]
  end
end
