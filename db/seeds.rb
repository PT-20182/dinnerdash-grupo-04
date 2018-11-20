# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: "Admin", email: "admin@dinnerdash.com", password: "plsDoNotHack123", admin: 666)
User.create(name: "Metal Avenger", email: "m.avenger@metaland.com.br", password: "satanImpera", admin: 0)
User.create(name: "Luigi", email: "supermariobro@nintendo.com", password: "S2daisyS2", admin: 0)
User.create(name: "アキラ", email: "shotarokaneda@toho.co.jp", password: "616B697261", admin: 0)