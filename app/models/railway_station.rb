class RailwayStation < ActiveRecord::Base
  validates :title presence: true

  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :initial_point, class_name: 'Ticket', foreign_key: :initial_station_id
  has_many :final_point, class_name: 'Ticket', foreign_key: :final_station_id
end
