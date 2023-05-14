class DoctorsController < ApplicationController
  before_action :authenticate_doctor!, only: [:update]

  def index
    specialty = Specialty.find_by name: params[:query]
    @doctors = Doctor.where(specialty:)
  end

  def show
    @doctor = Doctor.find params[:id]
  end

  def update
    @doctor = current_doctor

    if @doctor.update(doctor_params)
      render json: { message: "doctor info updated successfuly" }
    else
      render json: { message: "Error: couldn't update doctor" }, status: :unprocessable_entity
    end
  end

  private

  def doctor_params
    params.require(:doctor).permit(:first_name, :last_name, :specialty_id, :description)
  end
end
