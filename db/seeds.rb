# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  User.create(
    email: "john@doe.com",
    first_name: "John",
    last_name: "Doe",
    password: 'livefree',
    password_confirmation: 'livefree'
    )

40.times do
  f_name = Faker::Name.first_name
  User.create(
    first_name: f_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email(f_name),
    password: 'livefree',
    password_confirmation: 'livefree'
    )
end

10.times do 
  Category.create(name: Faker::Team.creature)  
end

  Project.create(
    name: "John Doe's Project #{Faker::Commerce.product_name} for #{Faker::Team.name}",
    description: Faker::Company.bs,
    funding_goal: [500, 1000, 2500, 5000, 10000, 15000].sample,
    start_date: Faker::Time.between(60.days.ago, Time.now, :all).to_date,
    end_date: Faker::Time.between(Time.now + 10.days, Time.now + 200.days, :all).to_date,
    owner_id: 1,
    category_id: Faker::Number.between(1, 10)
    )

100.times do
  Project.create(
    name: "#{Faker::Commerce.product_name} for #{Faker::Team.name}",
    description: Faker::Company.bs,
    funding_goal: [500, 1000, 2500, 5000, 10000, 15000].sample,
    start_date: Faker::Time.between(60.days.ago, Time.now, :all).to_date,
    end_date: Faker::Time.between(Time.now + 10.days, Time.now + 200.days, :all).to_date,
    owner_id: Faker::Number.between(1, 10),
    category_id: Faker::Number.between(1, 30)
    )
end

(1..100).each do |i|
  5.times do
    Reward.create(
      project_id: i,
      backer_limit: [50, 100, 250, 500, 1000, 1500].sample,
      amount: [5, 10, 25, 50, 100, 500, 1000].sample,
      name: "#{Faker::Hacker.adjective} #{Faker::Hacker.noun}",
      description: Faker::Lorem.sentence,
      )
  end
end