# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

PmReceiver.destroy_all
PrivateMessage.destroy_all
TagGossip.destroy_all
Tag.destroy_all
Gossip.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all

#Cities
10.times do |index|
  City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
    )
end

#Users
10.times do |index|
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Quote.yoda,
    email: Faker::Internet.email,
    age: rand(18..100),
    city_id: City.ids.sample
    )
end

#Gossips
20.times do |index|
  Gossip.create(
    title: Faker::TvShows::Suits.quote,
    content: Faker::Quote.yoda,
    user_id: User.ids.sample,
    city_id: City.ids.sample
    )
end

#Tags
10.times do |index|
  Tag.create(
    title: Faker::Ancient.primordial,
    )
end

#Gossips
Gossip.all.each do |g|
  rand(1..5).times do 
    TagGossip.create(
      tag_id: Tag.ids.sample,
      gossip_id: g.id
    )
  end
end

#Private Messages
20.times do |index|
  PrivateMessage.create(
    content: Faker::TvShows::Friends.quote,
    user_id: User.ids.sample
    )
end

#Private Message receivers
PrivateMessage.all.each do |p|
  rand(1..3).times do 
    PmReceiver.create(
      private_message_id: p.id,
      user_id: User.ids.sample
    )
  end
end
