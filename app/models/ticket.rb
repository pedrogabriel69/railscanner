class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :train
  belongs_to :initial_station, class_name: 'RailwayStation', foreign_key: :initial_station_id
  belongs_to :final_station, class_name: 'RailwayStation', foreign_key: :final_station_id
  
  after_create :send_notification
  after_destroy :send_notification!

  def route_name
  	"#{initial_station.title} - #{final_station.title}"
  end

  private

  def send_notification
  	TicketsMailer.buy_ticket(self.user, self).deliver_now
  end
  
  def send_notification!
  	TicketsMailer.cancel_ticket(self.user, self).deliver_now
  end
end
