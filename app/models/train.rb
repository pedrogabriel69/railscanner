class Train < ActiveRecord::Base
  belongs_to :route
  belongs_to :current_station, class_name: 'RailwayStation', foreign_key: :current_station_id
  has_many :tickets
  has_many :wagons

  validates :number, presence: true

  def count_seats(wagon_type, seats_type)
    wagons.where(type: wagon_type).sum(seats_type)
  end
end
