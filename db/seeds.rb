# === load specialties from input file

# Specialty.delete_all
# specialties = File.readlines('lib/specialties.txt')
# specialties.each do |specialty|
#   Specialty.create name: specialty.chomp
# end

# === create doctors
Doctor.delete_all

5.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  # email = Faker::Internet.email
  email = "#{first_name}_#{last_name}@email.com"
  password = '123123'
  specialty = Specialty.first

  specialty.doctors.create(email:, password:, first_name:, last_name:)
end
