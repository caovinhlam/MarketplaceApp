# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Category.destroy_all
Session.destroy_all
user = User.create(email: 'admin@test.com', password: 'admin123', first_name: 'First', last_name: 'Admin')
user2 = User.create(email: 'user@test.com', password: 'user123', first_name: 'Second', last_name: 'User')
user3 = User.create(email: '123@test.com', password: '123123', first_name: 'Third', last_name: 'Number')

cjson = JSON.parse(File.read(Rails.public_path.join('categories.json')))

cjson.each do |c|
    Category.create(name: c['category'])
end

Session.create(title: "Volleyball Training", description: "2 Courts - 6 v 6", user: user, category: Category.find_by(name: 'Sport'))
Session.create(title: "LCS", description: "E-sports: 5 v 5", user: user, category: Category.find_by(name: 'Contest'))
Session.create(title: "Please HELP!", description: "I need MONEY as soon as possible, please buy my merch", user: user2, category: Category.find_by(name: 'Fundraising'))
Session.create(title: "GAME TESTING!", description: "Learn how to be look for bugs and play while getting PAID!", user: user3, category: Category.find_by(name: 'Classes'))

puts "Users: #{User.count}"
puts "Categories: #{Category.count}"
puts "Sessions: #{Session.count}"
