class CreateParkingLots < ActiveRecord::Migration[5.2]
  def change
    create_table :parking_lots do |t|
      t.string :plate_number
      t.string :color
      t.boolean :available, default: true
      t.timestamps
    end
  end
end
