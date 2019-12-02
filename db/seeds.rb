# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
Category.destroy_all

User.create(user_name: "fmwong", password: "1234", first_name: "Mei", last_name: "Wong")
User.create(user_name: "buford", password: "1234", first_name: "Buford", last_name: "Eeds")

c1 = Category.create(category: 'service', credit: 25)
c2 = Category.create(category: 'handy man', credit: 75)
c3 = Category.create(category: 'moving help', credit: 100)
c4 = Category.create(category: 'grocery shopping', credit: 50)
