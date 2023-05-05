FactoryBot.define do
  factory :appointment do
    doctor { Doctor.find(Doctor.ids.sample) }
    duration { 15.minutes }
    start_time { Date.today + 8.hours }

    factory :appointment_with_patient do
      after(:create) do |appointment|
        patient = if Patient.none?
                    FactoryBot.create(:patient)
                  else
                    Patient.find(Patient.ids.sample)
                  end
        appointment.patient = patient
      end
    end
  end
end
