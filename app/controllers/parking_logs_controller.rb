class ParkingLogsController < ApplicationController
  def index
    @parking_logs = ParkingLog.all
  end
end