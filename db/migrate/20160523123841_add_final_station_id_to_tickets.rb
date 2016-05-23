class AddFinalStationIdToTickets < ActiveRecord::Migration
  def change
    add_belongs_to :tickets, :final_station
  end
end
