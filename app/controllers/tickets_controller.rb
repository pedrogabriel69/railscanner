class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ticket, only: [:show, :destroy]
  before_action :set_train, only: [:create]

  def index
    @tickets = current_user.tickets
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = current_user.tickets.new(train: @train, initial_station: @train.route.railway_stations.ordered.first,
      final_station: @train.route.railway_stations.ordered.last, name: params[:name],
      surname: params[:surname], passport_id: params[:passport_id])

      if @ticket.save
        redirect_to @ticket
      else
        render :new
      end
  end

  def show
    render :show, layout: false
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path(@ticket)
  end

  private

  def set_train
    @train = Train.find(params[:train_id])
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end
end
