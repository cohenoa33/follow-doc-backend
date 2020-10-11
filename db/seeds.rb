require 'faker'

User.create(
  username: (Faker::Name.first_name + Faker::Name.last_name),
  email: Faker::Internet.email,
  password: '123',
  password_confirmation: '123'
)

Dependent.create(
  name: Faker::TvShows::RuPaul.queen,
  user_id: User.all.sample.id
)

Problem.create(
  name: Faker::Science.element,
  dependent_id: Dependent.all.sample.id,
  description: Faker::TvShows::BigBangTheory.quote
)

Comment.create(
  problem_id: Problem.all.sample.id,
  text: Faker::TvShows::BigBangTheory.quote,
  status_open: %i[true false].sample
)

# Faker::Cannabis.health_benefit

Doctor.create(
name: "Dr. D",
street: "12519 NE 85th Street",
city: "Kirkland",
state: "WA",
zipcode: "98033",
info: "More info"
)

Appointment.create(
date: Faker::Date.between(from: Date.today, to: 1.year.from_now),
time: "10:00",
note: Faker::Cannabis.health_benefit, 
doctor_id: Doctor.all.sample.id, 
problem_id: Problem.all.sample.id, 
insurance_auth:  %i[true false].sample,
status_open: %i[true false].sample
)
	