class RailwayStation < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :routes, through: :railway_stations_routes
  has_many :initial_point, class_name: 'Ticket', foreign_key: :initial_station_id
  has_many :final_point, class_name: 'Ticket', foreign_key: :final_station_id

  scope :ordered, -> { joins(:railway_stations_routes).order("railway_stations_routes.position").uniq }
  
  validates :title, presence: true

  def update_position(route, position)
    station_route = station_route(route)
    station_route.update(position: position) if station_route
  end

  def update_arrive_departure(route, arrive, departure)
    station_route = station_route(route)
    station_route.update(arrive: arrive, departure: departure) if station_route
  end

  def position(route)
    station_route(route).try(:position)
  end

  def arrive(route)
    station_route(route).try(:arrive)
  end

  def departure(route)
    station_route(route).try(:departure)
  end

  protected

  def station_route(route)
    station_route ||= railway_stations_routes.where(route: route).first
  end
end
