class SchedulesController < ApplicationController
  before_action :authenticate_doctor!

  def show
    @schedule = current_doctor.schedule
    render json: @schedule
  end

  def update
    @schedule = current_doctor.schedule
    @schedule.content = params[:schedule]

    if @schedule.save
      render json: { message: "schedule updated successfuly" }
    else
      render json: { message: "Error: couldn't update schedule" }, status: :unprocessable_entity
    end
  end
end
