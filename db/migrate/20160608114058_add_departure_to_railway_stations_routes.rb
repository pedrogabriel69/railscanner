class AddDepartureToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :departure, :datetime, default: DateTime.now.getlocal
  end
end
