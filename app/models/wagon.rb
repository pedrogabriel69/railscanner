class Wagon < ActiveRecord::Base
  belongs_to :train
  
  validates :type, :up_seat, :down_seat, presence: true
end