class Wagon < ActiveRecord::Base
  belongs_to :train
  
  validates :number, presence: true
  validates :number, uniqueness: { scope: :train_id }

  before_validation :set_number

  scope :super_economy, -> { where(type: 'SuperEconomy') }
  scope :economy, -> { where(type: 'Economy') }
  scope :comfort, -> { where(type: 'Comfort') }
  scope :lux, -> { where(type: 'Lux') }
  scope :ordered, -> { order(:number) }
  scope :ordered_desc, -> { order('number DESC') }


  private

  def set_number
    self.number = train.wagons.size + 1
  end
end