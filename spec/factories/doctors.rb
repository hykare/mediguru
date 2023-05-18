FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}_#{last_name}@email.com" }
    password { '123123' }
    description { Faker::Lorem.paragraphs(number: 5).join(' ') }
    specialty { Specialty.first(10).sample }

    after(:create) do |doctor|
      create(:schedule, doctor:)
    end

    factory :doctor_with_appointments do
      duration = 15.minutes
      after(:create) do |doctor|
        3.times do |date_offset|
          shift_start_time = Date.today + date_offset.days + 8.hours
          10.times do |appointment_number|
            create(:appointment, doctor:, duration:, start_time: shift_start_time + appointment_number * duration)
          end
        end
      end
    end
  end
end
