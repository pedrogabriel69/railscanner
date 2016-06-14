class Route < ActiveRecord::Base
  has_many :trains
  has_many :railway_stations_routes
  has_many :railway_stations, through: :railway_stations_routes

  validates :name, presence: true
  validate :stations_count

  before_validation :set_name
  after_validation :set_station_number

  private

  def set_name
    self.name = "#{railway_stations.first.title} - #{railway_stations.last.title}"
  end

  def stations_count
    errors.add(:base, 'Route should contain at least 2 stations') if railway_stations.size < 2
  end

  def set_station_number
    railway_stations_routes.each_with_index { |station, index| station.number = index + 1 }
  end
end
