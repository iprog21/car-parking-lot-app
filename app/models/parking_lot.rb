class ParkingLot < ApplicationRecord
  validates :plate_number, presence: true, uniqueness: true
  has_many :logs, class_name: 'ParkingLog', dependent: :destroy
  scope :available, -> { where(:available => true)}
  def self.available_lot
    available.minimum(:id)
  end
  def amount_to_be_paid
    parked_time = time_parked
    if !grace_period.nil?
      parked_time =  time_parked + grace_period.minutes
    end
    time_collected = []
    (parked_time.to_datetime.to_i .. Time.now.strftime("%H:%M:%S").to_datetime.to_i).step(1.hour) do |date|
      time_collected << Time.at(date)
    end
    time_collected.size * hourly_rate
  end

  def time_difference(time_a, time_b)
    difference = time_b - time_a
  
    if difference > 0
      difference
    else
      24 * 3600 + difference 
    end
  end
end