class AddArriveToRailwayStationsRoutes < ActiveRecord::Migration
  def change
    add_column :railway_stations_routes, :arrive, :datetime
  end
end
