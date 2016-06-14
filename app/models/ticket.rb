class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :initial_station, class_name: 'RailwayStation', foreign_key: :initial_station_id
  belongs_to :final_station, class_name: 'RailwayStation', foreign_key: :final_station_id
end
