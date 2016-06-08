class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]
  before_action :set_train, only: [:new, :create]
  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @train = Train.find(params[:train_id])
    @wagon = Wagon.new
  end

  def edit
  end
  
  def create
    @wagon = @train.wagons.new(wagon_params)
      if @wagon.save
        redirect_to @train        
      else
        render :new
      end
  end

  def update    
    if @wagon.update(wagon_params)
        redirect_to @wagon
      else
        render :edit
    end        
  end

  def destroy
    @wagon.destroy
    redirect_to trains_path
  end

  private  
    
  def set_wagon
    @wagon = Wagon.find(params[:id]).becomes(Wagon)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end

  def wagon_params
    params.require(:wagon).permit(:type, :number, :top_seats, :bottom_seats, :side_top_seats, :side_bottom_seats, :economy_bottom_seats, :train_id)
  end  
end
