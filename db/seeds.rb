require 'faker'

User.create(
  username: "why",
  email: Faker::Internet.email,
  password: '123',
  password_confirmation: '123'
)

Dependent.create(
  name: Faker::TvShows::RuPaul.queen,
  user_id: 1
)

Problem.create(
  name: Faker::Science.element,
  dependent_id: 1,
  description: Faker::TvShows::BigBangTheory.quote
)

Comment.create(
  problem_id: Problem.all.sample.id,
  text: Faker::TvShows::BigBangTheory.quote,
  status_open: %i[true false].sample
)


Doctor.create(
name: Faker::TvShows::BigBangTheory.character,
street: "1600 Beach street",
city: "San Francisco",
state: "CA",
zipcode: "94123",
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

