class AddDepartureToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :departure, :datetime
  end
end
