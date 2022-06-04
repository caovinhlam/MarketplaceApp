# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Session.destroy_all

user = User.create(first_name: 'First', last_name: 'User')
user2 = User.create(first_name: 'Second', last_name: 'User')

user.sessions.create(title: "Volleyball Training", description: "2 Courts - 6 v 6")
user2.sessions.create(title: "Volleyball Match", description: "1 Court - 6 v 6")

puts "Users: #{User.count}"
puts "Sessions: #{Session.count}"