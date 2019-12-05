# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
Category.destroy_all
Errand.destroy_all

mei = User.create(user_name: 'mei', password: '1', first_name: 'Mei', last_name: 'Wong')
buford = User.create(user_name: 'buford', password: '1', first_name: 'Buford', last_name: 'Eeds')

yard_work = Category.create(category: 'Yard Work', credit: 25)
furniture_assembly = Category.create(category: 'Furniture Assembly', credit: 25)
heavy_lifting = Category.create(category: 'Heavy Lifting', credit: 20)
general_cleaning = Category.create(category: 'Yard Work', credit: 30)
wait_in_line = Category.create(category: 'Wait in Line', credit: 10)
office_admin = Category.create(category: 'Office Administration', credit: 50)
home_repair = Category.create(category: 'Home Repair', credit: 80)
delivery_service = Category.create(category: 'Delivery Service', credit: 25)

e1 = Errand.create(user_id: mei.id, category_id: yard_work.id, description: 'Need lawn mowing service')
e2 = Errand.create(user_id: mei.id, category_id: heavy_lifting.id, description: 'Declutter the house, need to move out the old sofa and fridge')
e3 = Errand.create(user_id: mei.id, category_id: general_cleaning.id, description: 'Need someone to clean the house, preferably on weekend')
e4 = Errand.create(user_id: buford.id, category_id: home_repair.id, description: 'AC not functioning')
e5 = Errand.create(user_id: buford.id, category_id: delivery_service.id, description: 'Donate couch to Goodwill')
e6 = Errand.create(user_id: buford.id, category_id: home_repair.id, description: 'In need of a plumber')
