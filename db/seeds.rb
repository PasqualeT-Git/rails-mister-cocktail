# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

puts "Creating the ingredient list"
print"."
sleep(1)
print"."
sleep(1)
print"."
sleep(1)

open_file = open(url).read
ingredients = JSON.parse(open_file)

ingredients.each do |ingredient|
  ingredient[1].each do |ing|
    Ingredient.create(name: ing["strIngredient1"] )
  end
end

puts "Adding some cocktail"
print"."
sleep(1)
print"."
sleep(1)
print"."
sleep(1)

file = URI.open("https://res.cloudinary.com/paky-images/image/upload/v1589585287/nb2oxe486vwsezjjvojey2lkhsg8.jpg")
cocktail = Cocktail.new(name: "Pinco-pallino")
cocktail.photo.attach(io: file, filename: 'cocktail.jpg', content_type: 'image/jpg')
cocktail.save!
