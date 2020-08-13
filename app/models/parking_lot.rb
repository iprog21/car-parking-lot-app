class ParkingLot < ApplicationRecord
  scope :available, -> { where(:available => true)}
  def self.available_lot
    available.minimum(:id)
  end
end