class AddArriveToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :arrive, :datetime, default: DateTime.now
  end
end
