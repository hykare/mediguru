class AppointmentsController < ApplicationController
  before_action :authenticate_doctor!, only: :index
  before_action :authenticate_patient!, only: :patient_index

  def index
    date = params[:on_date]
    @appointments = current_doctor.appointments.reserved.on_date(date)

    respond_to do |format|
      format.json { render json: @appointments }
    end
  end

  def patient_index
    @appointments = current_patient.appointments
    puts @appointments
  end
end
