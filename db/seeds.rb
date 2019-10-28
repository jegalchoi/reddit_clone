# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Sub.destroy_all
Post.destroy_all

ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('subs')
ApplicationRecord.connection.reset_pk_sequence!('posts')

User.create!(username: "jay",
            password: "password")

19.times do |n|
  username = Faker::Internet.username
  password = "password"
  User.create!(username: username,
              password: password)
end

19.times do |n|
  title = Faker::Superhero.name
  description = Faker::Superhero.power
  user_id = rand(1..19)
  Sub.create!(title: title,
              description: description,
              user_id: user_id)
end

19.times do |n|
  title = Faker::Lorem.sentence
  url = Faker::Internet.domain_name
  user_id = rand(1..19)
  sub_ids = rand(1..19)
  Post.create!(title: title,
              url: url,
              content: "",
              user_id: user_id,
              sub_ids: sub_ids)
end