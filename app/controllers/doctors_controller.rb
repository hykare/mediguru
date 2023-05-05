class DoctorsController < ApplicationController
  def index
    specialty = Specialty.find_by name: params[:query]
    @doctors = Doctor.where(specialty:)
  end

  def show
    @doctor = Doctor.find params[:id]
  end
end
