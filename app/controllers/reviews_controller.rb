class ReviewsController < ApplicationController
  before_action :set_facility, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.facility = @facility
    if @review.save
      redirect_to facility_path(@facility)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:facility_id, :content, :rating)
  end

  def set_facility
    @facility = Facility.find(params[:facility_id])
  end
end
