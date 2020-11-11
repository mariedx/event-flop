# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'time'

#create random users
10.times do
  User.create!(email: Faker::Name.first_name+Faker::Name.last_name+"@yopmail.com",
  password: ["yellow10!", "coucou10!", "marseille10!", "password10!", "supersuper10!"].sample,
  description: Faker::TvShows::Community.quotes,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name)
end
puts "*" * 20
puts "USERS"
puts tp User.all

#create random events
# 10.times do
#   admin = User.all.sample
#   Event.create!(start_date: "2020-12-15T00:00:00+00:00", #DateTime.now + rand(1..100),
#   duration: [15, 30, 45, 60, 90].sample,
#   title: Faker::TvShows::RuPaul.queen,
#   description: Faker::TvShows::RuPaul.quote + Faker::TvShows::RuPaul.quote,
#   price: Faker::Number.between(from: 1, to: 1000),
#   location: ["chemin Mendoza", "impasse Bariloche", "voie El Calafate", "avenue Buenos Aires", "place de Salta", "eglise El Chalten"].sample,
#   event_admin: User.all.sample)
# end
puts "*" * 20
puts "EVENTS"
puts tp Event.all