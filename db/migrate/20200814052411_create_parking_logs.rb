class CreateParkingLogs < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_logs do |t|
      t.references :parking_lot
      t.string :plate_number
      t.string :color
      t.datetime :entry
      t.datetime :departure
      t.decimal :hourly_rate, precision: 8, scale: 2, default: 0.0
      t.integer :grace_period
      t.decimal :amount_paid
      t.string :notes
      t.timestamps
    end
  end
end
