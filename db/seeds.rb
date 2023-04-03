# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Specialty.delete_all

specialties = File.readlines('lib/specialties.txt')

specialties.each do |specialty|
  Specialty.create name: specialty.chomp
end
