class WagonsController < ApplicationController
  before_action :set_wagon, only: [:show, :edit, :update, :destroy]

  def index
    @wagons = Wagon.all
  end

  def show
  end

  def new
    @wagon = Wagon.new
  end

  def edit
  end
  
  def create
    @wagon = Wagon.new(wagon_params)
      if @wagon.save
        redirect_to @wagon, notice: "Wagon was successfully created."        
      else
        render :new
      end
  end

  def update
    @wagon.type == 'Economy' ? update_economy : update_comfort            
  end

  def destroy
    @wagon.destroy
    redirect_to wagons_path
  end

  private

  def update_economy    
    if @wagon.update(economy_params)
        redirect_to @wagon
      else
        render :edit
    end        
  end

  def update_comfort   
    if @wagon.update(comfort_params)
        redirect_to @wagon
      else
        render :edit
    end        
  end
    
  def set_wagon
    @wagon = Wagon.find(params[:id])
  end

  def wagon_params
    params.require(:wagon).permit(:type, :up_seat, :down_seat, :train_id)
  end

  def economy_params
    params.require(:economy).permit(:type, :up_seat, :down_seat, :train_id)
  end

  def comfort_params
    params.require(:comfort).permit(:type, :up_seat, :down_seat, :train_id)
  end
end
