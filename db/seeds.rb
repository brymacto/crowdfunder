# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

## Seed User # 1 - for testing purposes
  User.create(
    email: "john@doe.com",
    first_name: "John",
    last_name: "Doe",
    password: 'livefree',
    password_confirmation: 'livefree'
    )
## Seed Users
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
## Seed Categories
10.times do 
  Category.create(name: Faker::Team.creature)  
end

## Seed project owned by user # 1 - for testing purposes
  Project.create(
    name: "John Doe's Project #{Faker::Commerce.product_name} for #{Faker::Team.name}",
    description: Faker::Company.bs,
    funding_goal: [500, 1000, 2500, 5000, 10000, 15000].sample,
    start_date: Faker::Time.between(60.days.ago, Time.now, :all).to_date,
    end_date: Faker::Time.between(Time.now + 10.days, Time.now + 200.days, :all).to_date,
    owner_id: 1,
    category_id: Faker::Number.between(1, 10)
    )
## Seed projects
100.times do
  Project.create(
    name: "#{Faker::Commerce.product_name} for #{Faker::Team.name}",
    description: Faker::Company.bs,
    funding_goal: [500, 1000, 2500, 5000, 10000, 15000].sample,
    start_date: Faker::Time.between(60.days.ago, Time.now, :all).to_date,
    end_date: Faker::Time.between(Time.now + 10.days, Time.now + 200.days, :all).to_date,
    owner_id: Faker::Number.between(1, 30),
    category_id: Faker::Number.between(1, 10)
    )
end

## Seed rewards and comments
comments = ["I love this project!", "Good work guys, keep it up", "I'm very disappointed in this project and do not encourage anyone to support it", "LUV IT", "I'm telling all my friends about this", "Yayyy"]
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
  3.times do
    Comment.create(
      message: comments.sample,
      user_id: Faker::Number.between(1, 40),
      project_id: i
      )
  end
end

    tag_list = ["Tag 1", "Tag 2", "Tag 3", "Tag 4", "Tag 5", "Tag 6"]
    tag_list.each do |tag|
      ActsAsTaggableOn::Tag.new(:name => tag).save
    end
    (1..100).each do |i|
      p = Project.find(i)
      5.times do 
        p.tag_list.add(tag_list.sample)
      end
      p.save
    end