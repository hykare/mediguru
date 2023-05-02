class AppointmentsController < ApplicationController
  before_action :authenticate_doctor!

  def index
    date = params[:on_date]
    @appointments = current_doctor.appointments.on_date(date)

    respond_to do |format|
      format.json { render json: @appointments }
    end
  end
end
