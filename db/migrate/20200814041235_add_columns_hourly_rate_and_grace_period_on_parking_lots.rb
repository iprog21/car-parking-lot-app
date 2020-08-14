class AddColumnsHourlyRateAndGracePeriodOnParkingLots < ActiveRecord::Migration[5.2]
  def change
    add_column :parking_lots, :hourly_rate, :decimal, precision: 8, scale: 2, default: 0.0
    add_column :parking_lots, :grace_period, :integer, default: 0
    add_column :parking_lots, :time_parked, :datetime
  end
end
