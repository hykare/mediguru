# === load specialties from input file

# Specialty.delete_all
# specialties = File.readlines('lib/specialties.txt')
# specialties.each do |specialty|
#   Specialty.create name: specialty.chomp
# end

# === create doctors
# Doctor.delete_all

# 5.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   # email = Faker::Internet.email
#   email = "#{first_name}_#{last_name}@email.com"
#   password = '123123'
#   specialty = Specialty.first
#   description = Faker::Lorem.paragraphs(number: 5).join(" ")

#   specialty.doctors.create(email:, password:, first_name:, last_name:, description:)
# end

# === create patients

# 50.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   email = "#{first_name}_#{last_name}@email.com"
#   password = '123123'

#   Patient.create(email:, password:, first_name:, last_name:)
# end

# === create appointments
Appointment.delete_all

Doctor.all.each do |doctor|
  duration = 15.minutes

  5.times do |i|
    patient = Patient.find(Patient.ids.sample)
    # might be faster
    # patient_count = Patient.count
    # random_offset = rand(patient_count)
    # random_patient = Patient.offset(random_offset).first

    shift_start = Date.today + 8.hours
    appointment_time = shift_start + i * duration

    Appointment.create(doctor:, patient:, start_time: appointment_time, duration:)
  end
end
