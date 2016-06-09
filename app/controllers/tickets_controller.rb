class TicketsController < ApplicationController
  before_action :set_ticket, only: [:show]
  before_action :set_train, only: [:new, :create]

  def new
    @ticket = Ticket.new
    @user = User.new
  end

  def create
    @user = User.new(name: params[:name], surname: params[:surname], passport_id: params[:passport_id])
    if @user.save
    @ticket = @train.tickets.create(user: @user, train: @train, initial_station: @train.route.railway_stations.ordered.first,
                                final_station: @train.route.railway_stations.ordered.last)
        redirect_to @ticket       
      else
        render :new
      end
  end

  def show
  end
  
  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
