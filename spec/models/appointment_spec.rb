require 'rails_helper'

RSpec.describe Appointment, type: :model do
  context 'appointment in the future and with no patient attached' do
    it 'is available' do
      appointment = Appointment.new start_time: (Time.now + 1.hour)
      expect(appointment).to be_available
    end
  end
  context 'appointment in the past' do
    it 'is not available' do
      appointment = Appointment.new start_time: (Time.now - 1.hour)
      expect(appointment).not_to be_available
    end
  end
  context 'appointment with a patient attached' do
    it 'is reserved' do
      patient = Patient.new
      appointment = Appointment.new patient: patient
      expect(appointment).to be_reserved
    end
    it 'is not available' do
      patient = Patient.new
      appointment = Appointment.new patient: patient
      expect(appointment).not_to be_available
    end
  end
  context 'appointment starting in an hour' do
    it 'is future' do
      appointment = Appointment.new start_time: (Time.now + 1.hour)
      expect(appointment).to be_future
    end
  end
  context 'appointment starting now' do
    it 'is not future' do
      appointment = Appointment.new start_time: Time.now
      expect(appointment).not_to be_future
    end
  end
end
