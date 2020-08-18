class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def show
    @facility = Facility.find(params[:id])
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)
    @facility.user = current_user

    if @facility.save
      redirect_to @facility, notice: "Your facility has been successfully created"
    else 
      render 'new'
    end
  end

  def facility_params
    params.require(:facility).permit(:user_id, :name, :address, :category, :description, :price, :capacity, :photo)
  end



end
