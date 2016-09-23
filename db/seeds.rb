# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


mike = User.create!(email: "mike@email.com", password: "hellohello")
taylor = User.create!(email: "taylor@email.com", password: "hellohello")
tracy = User.create!(email: "tracy@email.com", password: "hellohello")
matt = User.create!(email: "matt@email.com", password: "hellohello")

hammer = Product.create!(photo: "", product_url: "", description: "DEWALT 20 oz. Hammer", model_number: "", price: 29.97)
saw = Product.create!(photo: "", product_url: "", description: "Ryobi 13-Amp 7-1/4 in. Circular Saw", model_number: "", price: 39.97)
plywood = Product.create!(photo: "", product_url: "", description: "Underlayment (Common: 7/32 in. x 4 ft. x 8 ft.", model_number: "", price: 11.97)
paint = Product.create!(photo: "", product_url: "", description: "American Heartland Flat Classic Red Latex Barn & Fence Paint - 5 gal.", model_number: "", price: 45.97)

treehouse = Project.create!(title: "Treehouse", total_price: 0, user_id: 1)
swing_set = Project.create!(title: "Swing-set", total_price: 0, user_id: 2)
bench = Project.create!(title: "Work Bench", total_price: 0, user_id: 3)

