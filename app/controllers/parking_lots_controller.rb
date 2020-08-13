class ParkingLotsController < ApplicationController
  def new; end
  def create
    total_parking_lots = params[:total_parking_lots]
    for i in 1..total_parking_lots.to_i
      ParkingLot.create
    end
    redirect_to request.referrer, notice: "New Parking Lots Has Been Successfully Created"
  end
end