class Admin::TicketsController < Admin::BaseController
  before_action :set_ticket, only: [:show, :destroy, :edit, :update]

  def index
    @tickets = Ticket.all
  end

  def edit
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to [:admin, @ticket]
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :surname, :passport_id)
  end
end