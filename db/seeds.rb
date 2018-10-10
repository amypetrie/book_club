# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user_1 = User.create(name: "Amy Petrie")
author_1 = Author.create(name: "Patrick Rothfuss")
book_1 = author_1.books.create(title: "The Name of the Wind", page_num: 57, year_published: 2000)
review_1 = book_1.reviews.create(review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_name: "booklover1")
# eddie_special_1 = eddie_m.specials.create(title: "Raw", run_time: 85, image_url: "https://m.media-amazon.com/images/M/MV5BOWEwYTk4YTgtZGVjNi00MmI0LTkwOTItOWUxYzBlN2YwZWFkXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
