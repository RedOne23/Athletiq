class FacilitiesController < ApplicationController
  def index
    @facilities = Facility.all
  end

  def show

  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.new(facility_params)

    if @facility.save
      redirect_to facility_path(@facility), notice: "Your facility has been successfully created"
    else 
      render 'new'
    end
  end

  def facility_params
    params.require(:facility).permit(:name, :address, :category, :description, :price, :capacity)
  end



end
