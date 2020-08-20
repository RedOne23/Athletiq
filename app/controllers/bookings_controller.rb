class BookingsController < ApplicationController
  def new
    @facility = Facility.find(params[:facility_id])
    @booking = Booking.new
  end

  def create
    @facility = Facility.find(params[:facility_id])
    @booking = Booking.new(booking_params)
    @booking.facility = @facility
    @booking.user = current_user
    if @booking.save
      redirect_to facility_path(@facility), notice: "Your booking has been successfully created"
    else
      render :new
    end
  end

    private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
