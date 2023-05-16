class ReviewsController < ApplicationController
  before_action :authenticate_doctor!, only: :index

  def index
    @reviews = Review.where(doctor: current_doctor)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end

  def create
    @review = Review.new review_params

    if @review.save
      redirect_to @review.doctor
    else
      render 'doctors/show', status: :unprocessable_entity
    end
  end

  private

  def review_params
    # params.require(:review).permit(:score, :body, :patient_id, :doctor_id)
    params.require(:review).permit(:score, :body, :patient_id, :doctor_id)
  end
end
