class ParkingLotsController < ApplicationController
  def new; end
  def create
    total_parking_lots = params[:total_parking_lots]
    hourly_rate = params[:hourly_rate]
    grace_period = params[:grace_period]

    for i in 1..total_parking_lots.to_i
      parking_lot = ParkingLot.new(hourly_rate: hourly_rate, grace_period: grace_period)
      parking_lot.save(validate: false)
    end
    redirect_to root_path, notice: "New Parking Lots Has Been Successfully Created"
  end
  def update
    @parking_lot = ParkingLot.find params[:id]
    @parking_lot.attributes = parking_lot_params
    @parking_lot.available = false
    @parking_lot.time_parked = Time.now
    if @parking_lot.save
      redirect_to root_path, notice: "#{@parking_lot.plate_number} with color #{@parking_lot.color} has been parked successfully."
    else
      duplicate_lot = ParkingLot.find_by(plate_number: @parking_lot.plate_number)
      redirect_to request.referrer, alert: "#{@parking_lot.plate_number} had already been parked on Lot #{duplicate_lot.id}"
    end
  end
  def new_car_to_park
    if !ParkingLot.available_lot.nil?
      @parking_lot = ParkingLot.find(ParkingLot.available_lot)
    else
      redirect_to root_path, alert: "Sorry, Parking Lot Is Full"
    end
  end
  def leave_parking_lot
    
    @parking_lot = ParkingLot.find params[:id]
   
    if request.post?
      parking_log = ParkingLog.new
      parking_log.parking_lot_id =  @parking_lot.id
      parking_log.plate_number = @parking_lot.plate_number
      parking_log.color = @parking_lot.color
      parking_log.entry = @parking_lot.time_parked
      parking_log.departure = Time.now
      parking_log.hourly_rate = @parking_lot.hourly_rate
      parking_log.grace_period = @parking_lot.grace_period
      amount_to_pay =  @parking_lot.amount_to_be_paid
      parking_log.amount_paid = amount_to_pay
      notes = "Parking Lot #{@parking_lot.id} is free"
      if amount_to_pay == 0
        notes += " paid 0.0 (grace period)"
      else
        notes += " paid #{amount_to_pay}"
      end
      parking_log.notes = notes
      parking_log.save(validate: false)
      
      plate_number = @parking_lot.plate_number
      @parking_lot.plate_number = @parking_lot.color = nil
      @parking_lot.available = true
      @parking_lot.time_parked = nil
      @parking_lot.save(validate: false)
      redirect_to root_path, notice: notes
    end

  end
  protected
  def parking_lot_params
    params.require(:parking_lot).permit(:plate_number, :color)
  end
end