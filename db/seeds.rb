# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

#Create Articles
500.times do
  title = Faker::Books::Lovecraft.tome
  body = Faker::Books::Lovecraft.paragraph
  tag_names = Faker::Books::Lovecraft.words(number: Random.rand(5)).join(' ')
  post :create, params: { title: title, body: body, tag_names: tag_names }
end
