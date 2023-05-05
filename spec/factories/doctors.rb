FactoryBot.define do
  factory :doctor do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { "#{first_name}_#{last_name}@email.com" }
    password { '123123' }
    description { Faker::Lorem.paragraphs(number: 5).join(' ') }
    specialty { Specialty.first(10).sample }

    factory :doctor_with_appointments do
      after(:create) do |doctor|
        10.times do |i|
          duration = 15.minutes
          shift_start_time = Date.today + 8.hours
          create(:appointment, doctor:, duration:, start_time: shift_start_time + i * duration)
        end
      end
    end
  end
end
