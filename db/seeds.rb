# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.destroy_all 
# Category.destroy_all

# User.create(user_name: "fmwong", password: "1234", first_name: "Mei", last_name: "Wong")
# User.create(user_name: "buford", password: "1234", first_name: "Buford", last_name: "Eeds")


c1 = Category.create(category: 'Service', credit: 25)
c2 = Category.create(category: 'Handy Man', credit: 75)
c3 = Category.create(category: 'Moving Help', credit: 100)
c4 = Category.create(category: 'Grocery Shopping', credit: 50)

e1 = Errand.create(category_id: 1, user_id: 1, description: "Delivery service")
e2 = Errand.create(category_id: 2, user_id: 1, description: "Fix my plumbing")
e3 = Errand.create(category_id: 2, user_id: 1, description: "Furniture assembly")
e4 = Errand.create(category_id: 2, user_id: 1, description: "Paint my interior")
e5 = Errand.create(category_id: 2, user_id: 1, description: "Hang picture")
e6 = Errand.create(category_id: 1, user_id: 1, description: "Grocerries pickup")
e7 = Errand.create(category_id: 2, user_id: 1, description: "Organize closet")
e8 = Errand.create(category_id: 2, user_id: 1, description: "Mounting")
e9 = Errand.create(category_id: 2, user_id: 1, description: "Rearrange furniture")

