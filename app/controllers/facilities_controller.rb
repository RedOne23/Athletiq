class FacilitiesController < ApplicationController
  def index
    

    if params[:query].present?
      sql_query = "category ILIKE :query"
      @facilities = Facility.where(sql_query, query: "%#{params[:query]}%")
    else
      @facilities = Facility.geocoded
      @facilities = Facility.order(created_at: :DESC)
    end

    @markers = @facilities.map do |facility|
      {
        lat: facility.latitude,
        lng: facility.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { facility: facility })
      }
    end

  
  end

  def show
    @facility = Facility.geocoded.find(params[:id])
    @markers = [{
        lat: @facility.latitude,
        lng: @facility.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { facility: @facility })
      }]
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

  def edit
    @facility = Facility.find(params[:id])
  end

  def update
    @facility = Facility.find(params[:id])
    @facility.update(facility_params)
    redirect_to facility_path(@facility)
  end

  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy

    # no need for app/views/restaurants/destroy.html.erb
    redirect_to facilities_path
  end

  def facility_params
    params.require(:facility).permit(:user_id, :name, :address, :category, :description, :price, :capacity, :photo)
  end



end
