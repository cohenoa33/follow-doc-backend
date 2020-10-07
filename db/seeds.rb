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
