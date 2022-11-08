# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all

10.times do
  City.new(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
end

10.times do
  User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 100),
    city: City.all.sample
  )
end

20.times do
  Gossip.new(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user: User.all.sample
  )
end

10.times do
  Tag.new(
    title: Faker::Lorem.word
  )
end

Gossip.all.each do |gossip|
  TagOfGossip.new(
    gossip:,
    tag: Tag.all.sample
  )
end

10.times do
  PrivateMessage.new(
    content: Faker::Lorem.paragraph,
    sender: User.all.sample,
    recipient: User.all.sample
  )
end
