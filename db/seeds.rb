# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#destroy_all
User.destroy_all
Story.destroy_all

2.times do |i|
  User.create(
    email: Faker::Internet.email,
    password: "azerty",
    password_confirmation: "azerty"
    # name: Faker::Name.name,
    # description: Faker::Lorem.paragraph(sentence_count: 2)
  )
  puts "#{i} user(s) created"
  puts "*"*(i+1)
end


8.times do |i|
  Story.create(
    title:       Faker::Book.title,
    content:     Faker::Books::Lovecraft.paragraph(sentence_count: 7),
    author:      Faker::Book.author,
    image_url:   Faker::LoremFlickr.image(size: "100x100", search_terms: ['books']),
    user_id:     User.all.sample.id
  )
  puts "#{i} story(ies) created"
  puts "*"*(i+1)
end