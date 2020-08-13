class ParkingLot < ApplicationRecord
  validates :plate_number, presence: true, uniqueness: true
  scope :available, -> { where(:available => true)}
  def self.available_lot
    available.minimum(:id)
  end
end