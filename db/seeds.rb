# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# user_1 = User.create(name: "Amy Petrie")

book_1 = Book.create(title: "The Name of the Wind", page_num: 570, year_published: 2000)
author_1 = book_1.authors.create(name: "Patrick Rothfuss")

review_1 = book_1.reviews.create(review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_name: "booklover1")
review_2 = book_1.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_name: "John Smith")
review_3 = book_1.reviews.create(review_title: "Worthwhile", rating: 4, review_text: "I enjoyed this book a lot", user_name: "Kyle")

book_2 = Book.create(title: "Shogun", page_num: 995, year_published: 1968)
author_2 = book_2.authors.create(name: "James Clavell")

review_4 = book_2.reviews.create(review_title: "Epic read!", rating: 5, review_text: "Loved it!", user_name: "Critic McGibbons")
review_5 = book_2.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_name: "Tony Malone")
review_6 = book_2.reviews.create(review_title: "A little too long", rating: 3, review_text: "I enjoyed this book, but it was long", user_name: "George Cormack")
# 
# book_3 = Book.create(title: "Lord of the Rings", page_num: 995, year_published: 1968)
# author_2 = book_2.authors.create(name: "James Clavell")
#
# review_4 = book_2.reviews.create(review_title: "Epic read!", rating: 5, review_text: "Loved it!", user_name: "Critic McGibbons")
# review_5 = book_2.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_name: "Tony Malone")
# review_6 = book_2.reviews.create(review_title: "A little too long", rating: 3, review_text: "I enjoyed this book, but it was long", user_name: "George Cormack")


# eddie_special_1 = eddie_m.specials.create(title: "Raw", run_time: 85, image_url: "https://m.media-amazon.com/images/M/MV5BOWEwYTk4YTgtZGVjNi00MmI0LTkwOTItOWUxYzBlN2YwZWFkXkEyXkFqcGdeQXVyNzc5MjA3OA@@._V1_SY1000_CR0,0,666,1000_AL_.jpg")
# author_2 = Author.create(name: "James Clavell")
# book_2 = author_2.books.create(title: "Shogun", page_num: 938, year_published: 1970)
# review_4 = book_2.reviews.create(review_title: "Best epic of all time", rating: 5, review_text: "Such a great book!", user_name: "Tom")
# review_5 = book_2.reviews.create(review_title: "Very long, but good", rating: 5, review_text: "Such a great book!", user_name: "Jenny")
# review_6 = book_2.reviews.create(review_title: "My favorite!", rating: 5, review_text: "Such a great book!", user_name: "Alice")
#
# author_3 = Author.create(name: "Dr. Jenny Smith")
# author_4 = Author.create(name: "Dr. Robin Smith")
# book_3 = author_2.books.create(title: "Shogun", page_num: 938, year_published: 1970)
# review_7 = book_2.reviews.create(review_title: "Best epic of all time", rating: 5, review_text: "Such a great book!", user_name: "Jennifer")
