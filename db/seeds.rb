specialties = File.readlines('lib/specialties.txt')
specialties.each do |specialty|
  Specialty.create name: specialty.chomp
end

20.times do
  FactoryBot.create(:doctor_with_appointments)
end

50.times do
  FactoryBot.create(:patient)
end

Doctor.all.each do |doctor|
  # reserve some appointments
  doctor.appointments.sample(4).each do |appointment|
    appointment.patient_id = Patient.ids.sample
    appointment.save
  end

  5.times { FactoryBot.create(:review, doctor:) }
end
