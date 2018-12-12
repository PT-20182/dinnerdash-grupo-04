# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seeds for users
User.create(name: "Admin", email: "admin@dinnerdash.com", password: "admin123", admin: true)
User.create(name: "Metal Avenger", email: "m.avenger@metaland.com.br", password: "satanImpera", admin: false)
User.create(name: "Luigi", email: "supermariobro@nintendo.com", password: "S2daisyS2", admin: false)
User.create(name: "アキラ", email: "shotarokaneda@toho.co.jp", password: "616B697261", admin: false)

# Seeds for meal categories
MealCategory.create(name: "Metállica")
MealCategory.create(name: "Massas")
MealCategory.create(name: "Japonesa")

# Seeds for orders
Order.create(price: 42.00, user_id: 1, situation_id: 1)
Order.create(price: 43.00, user_id: 1, situation_id: 2)

# Seeds for Situation
Situation.create(description: "pendente")
Situation.create(description: "cancelado")
Situation.create(description: "confirmado")