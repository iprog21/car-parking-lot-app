class ParkingLot < ApplicationRecord
  validates :plate_number, presence: true, uniqueness: true
  has_many :logs, class_name: 'ParkingLog', dependent: :destroy
  scope :available, -> { where(:available => true)}
  def self.available_lot
    available.minimum(:id)
  end
end