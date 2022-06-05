# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Session.destroy_all
user = User.create(email: 'admin@test.com', password: 'admin123', first_name: 'First', last_name: 'Admin')
user2 = User.create(email: 'user@test.com', password: 'user123', first_name: 'Second', last_name: 'User')
user3 = User.create(email: '123@test.com', password: '123123', first_name: 'Third', last_name: 'Number')

user.sessions.create(title: "Volleyball Training", description: "1 Courts - 6 v 6")
user.sessions.create(title: "Volleyball Match", description: "2 Court - 6 v 6")
user2.sessions.create(title: "User Match", description: "3 Court - 6 v 6")
user3.sessions.create(title: "Test Match", description: "123 Court - 123 v 123")

puts "Users: #{User.count}"
puts "Sessions: #{Session.count}"