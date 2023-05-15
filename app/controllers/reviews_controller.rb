class ReviewsController < ApplicationController
  before_action :authenticate_doctor!, only: :index

  def index
    @reviews = Review.where(doctor: current_doctor)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reviews }
    end
  end
end
