class SearchesController < ApplicationController

  def create
    @initial_station = RailwayStation.find(params[:initial_station_id])
    @final_station = RailwayStation.find(params[:final_station_id])
    @routes = @initial_station.routes & @final_station.routes
    render :show
  end

  def show
    @routes = [nil]
  end
end
