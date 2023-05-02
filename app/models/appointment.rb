class Appointment < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  scope :on_date, lambda { |date = Date.today|
    if date.is_a? String
      date = Date.parse(date)
    elsif date.nil?
      date = Date.today
    end
    where('start_time >= ? AND start_time < ?', date.yesterday, date.tomorrow)
  }

  def as_json(_options = {})
    { patient: "#{patient.first_name} #{patient.last_name}",
      doctor: "#{doctor.first_name} #{doctor.last_name}",
      time: start_time,
      duration: }
  end
end
