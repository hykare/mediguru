FactoryBot.define do
  factory :review do
    doctor { Doctor.find(Doctor.ids.sample) }
    patient { Patient.find(Patient.ids.sample) }
    score { rand(1..5) }
    body { Faker::Lorem.paragraphs(number: 5).join(' ') }
  end
end
