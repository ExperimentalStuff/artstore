# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.new
u.email = "admin@test.com"
u.password = "12345678"
u.password_confirmation = "12345678"
u.is_admin = true
u.save

Product.create({title: "product1", description: "xxx", quantity: "10", price: "2"})
Product.create({title: "product2", description: "xxx", quantity: "20", price: "3"})
Product.create({title: "product3", description: "xxx", quantity: "30", price: "4"})
