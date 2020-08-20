class BookingsController < ApplicationController
  def list
    @bookings = Booking.all
  end

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

  def delete
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_path
  end

    private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
