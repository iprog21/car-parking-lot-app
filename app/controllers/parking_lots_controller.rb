class ParkingLotsController < ApplicationController
  def new; end
  def create
    total_parking_lots = params[:total_parking_lots]
    for i in 1..total_parking_lots.to_i
      ParkingLot.create
    end
    redirect_to root_path, notice: "New Parking Lots Has Been Successfully Created"
  end
  def update
    @parking_lot = ParkingLot.find params[:id]
    @parking_lot.attributes = parking_lot_params
    @parking_lot.available = false
    @parking_lot.save
    redirect_to request.referrer, notice: "#{@parking_lot.plate_number} with color #{@parking_lot.color} has been parked successfully."
  end
  def new_car_to_park
    @parking_lot = ParkingLot.find(ParkingLot.available_lot)
  end
  protected
  def parking_lot_params
    params.require(:parking_lot).permit(:plate_number, :color)
  end
end