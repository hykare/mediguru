class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient, optional: true

  scope :on_date, lambda { |date = Date.today|
    if date.is_a? String
      date = Date.parse(date)
    elsif date.nil?
      date = Date.today
    end
    where('start_time >= ? AND start_time < ?', date, date.tomorrow)
  }
  scope :reserved, -> { where('patient_id IS NOT NULL') }

  def as_json(_options = {})
    {
      time: start_time,
      duration:,
      patient_name: "#{patient.first_name} #{patient.last_name}",
      patient_email: patient.email
    }
  end

  def date_formatted
    start_time.strftime('%d.%m.%Y')
  end
  
  def time_formatted
    start_time.strftime('%k:%M')
  end
end
