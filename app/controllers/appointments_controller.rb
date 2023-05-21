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

  def edit
    @appointment = Appointment.find params[:id]
  end

  def update
    @appointment = Appointment.find params[:id]

    if @appointment.update appointment_params
      redirect_to @appointment.doctor
    else
      render :new, status: :unprocessable_entity
    end
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id)
  end
end
