class AddInitialStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :initial_station
  end
end
