# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(email: "kkwoker@hotmail.com", firstname: "Kinnan", lastname: "Kwok", password: "1234", password_confirmation: "1234")
User.create(email: "guy1@example.com", firstname: "guy1", lastname: "last1")
User.create(email: "guy2@example.com", firstname: "guy2", lastname: "last2")
User.create(email: "guy3@example.com", firstname: "guy3", lastname: "last3")
User.create(email: "guy4@example.com", firstname: "guy4", lastname: "last4")
User.create(email: "guy5@example.com", firstname: "guy5", lastname: "last5")
User.create(email: "guy6@example.com", firstname: "guy6", lastname: "last6")
User.create(email: "guy7@example.com", firstname: "guy7", lastname: "last7")
User.create(email: "guy8@example.com", firstname: "guy8", lastname: "last8")



# USE poster_url and save image into public folder
# movie1 = Movie.create(title: "The Dark Knight Rises", director: "Christopher Nolan", runtime_in_minutes: 165, image: "dark-knight-rises-poster.jpg")
# movie2 = Movie.create(title: "Toy Story 3", director: "Lee Unkrich", runtime_in_minutes: 105, image: "toy-story-3.jpg")
# movie3 = Movie.create(title: "Frozen", director: "Chris Buck, Jennifer Lee", runtime_in_minutes: 108, image: "frozen.jpg")