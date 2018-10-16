# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user_1 = User.create(user_name: "booklover11")
user_2 = User.create(user_name: "John Smith")
user_3 = User.create(user_name: "Kyle Smithers")
user_4 = User.create(user_name: "Critic McGibbons")
user_5 = User.create(user_name: "George Cormack")
user_6 = User.create(user_name: "unhappy camper")
user_7 = User.create(user_name: "Susan McPhalen")
user_8 = User.create(user_name: "jenny_kramer_123")
user_9 = User.create(user_name: "i_love_books_98")
user_10 = User.create(user_name: "Amy Petrie")
user_11 = User.create(user_name: "Tim Fell")
user_12 = User.create(user_name: "Tony Malone")

book_1 = Book.create(title: "The Name of the Wind", page_num: 570, year_published: 2000)
author_1 = book_1.authors.create(name: "Patrick Rothfuss")

review_1 = book_1.reviews.create(review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_id: user_1.id)
review_2 = book_1.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: user_2.id)
review_3 = book_1.reviews.create(review_title: "Worthwhile", rating: 3, review_text: "I enjoyed this book a lot", user_id: user_3.id)
review_4 = book_1.reviews.create(review_title: "Epic read!", rating: 4, review_text: "Loved it!", user_id: user_4.id)
review_5 = book_1.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_id: user_6.id)
review_6 = book_1.reviews.create(review_title: "A little too long", rating: 4, review_text: "I enjoyed this book, but it was long", user_id: user_7.id)

book_2 = Book.create(title: "Shogun", page_num: 995, year_published: 1968)
author_2 = book_2.authors.create(name: "James Clavell")

review_23 = book_2.reviews.create(review_title: "Epic read!", rating: 3, review_text: "Loved it!", user_id: user_4.id)
review_24 = book_2.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_id: user_12.id)
review_25 = book_2.reviews.create(review_title: "A little too long", rating: 4, review_text: "I enjoyed this book, but it was long", user_id: user_5.id)

book_3 = Book.create(title: "How To Help Your Marraige", page_num: 234, year_published: 2015)
author_3 = book_3.authors.create(name: "Dr. Brad Smith")
author_4 = book_3.authors.create(name: "Dr. Angelina Smith")

review_7 = book_3.reviews.create(review_title: "Not helpful", rating: 2, review_text: "This book was contrite and trivial.", user_id: user_6.id)
review_8 = book_3.reviews.create(review_title: "Marriage ruiner!", rating: 1, review_text: "My marriage was made worse through this book.", user_id: user_12.id)


book_4 = Book.create(title: "The Great Gatsby", page_num: 301, year_published: 1925)
author_5 = book_4.authors.create(name: "F. Scott Fitzgerald")

review_10 = book_4.reviews.create(review_title: "Not my favorite", rating: 3, review_text: "The love story was sad and had a bad ending", user_id: user_4.id)
review_11 = book_4.reviews.create(review_title: "Themes that last the ages", rating: 4, review_text: "I love this book, everyone should read it.", user_id: user_7.id)
review_12 = book_4.reviews.create(review_title: "Rich and nostalgic", rating: 5, review_text: "The authors appear to not know how to write.", user_id: user_5.id)

book_5 = Book.create(title: "Wuthering Heights", page_num: 348, year_published: 1890)
author_6 = book_5.authors.create(name: "Emily Bronte")

review_13 = book_5.reviews.create(review_title: "Why the popularity?", rating: 3, review_text: "Overrated tale of love and deception", user_id: user_5.id)
review_14 = book_5.reviews.create(review_title: "Undying love", rating: 5, review_text: "I love this book, everyone should read it.", user_id: user_12.id)
review_14 = book_5.reviews.create(review_title: "Love and Betrayal", rating: 5, review_text: "I love this book, everyone should read it.", user_id: user_8.id)

book_6 = Book.create(title: "Old Man and The Sea", page_num: 396, year_published: 1922)
author_7 = book_6.authors.create(name: "Ernest Hemmingway")

review_15 = book_6.reviews.create(review_title: "Lovely Tale", rating: 4, review_text: "It was beautifully written, but the pace was a bit slow.", user_id: user_8.id)
review_16 = book_6.reviews.create(review_title: "Stunning and scary", rating: 4, review_text: "I wasnt scared and enchanted", user_id: user_1.id)
review_17 = book_6.reviews.create(review_title: "AWESOME!!", rating: 5, review_text: "It was so great", user_id: user_3.id)
book_6.reviews.create(review_title: "glad I read it", rating: 3, review_text: "It was so good but hard to understand", user_id: user_11.id)

book_7 = author_2.books.create(title: "Tai-Pan", page_num: 1081, year_published: 1985)

review_18 = book_7.reviews.create(review_title: "Fav Clavell book!", rating: 5, review_text: "Best of the series by far!", user_id: user_8.id)
review_19 = book_7.reviews.create(review_title: "Clavell doesnt disappoint!", rating: 5, review_text: "The writing and descriptions have no match.", user_id: user_12.id)

book_8 = author_2.books.create(title: "Noble House", page_num: 976, year_published: 1989)
review_20 = book_8.reviews.create(review_title: "Left me speechless", rating: 5, review_text: "Cant wait to read again!", user_id: user_10.id)
review_21 = book_8.reviews.create(review_title: "Didnt enjoy that much", rating: 4, review_text: "Way too long, should have been shorter.", user_id: user_11.id)
review_22 = book_8.reviews.create(review_title: "The best!!", rating: 4, review_text: "Super great!", user_id: user_9.id)

book_9 = author_1.books.create(title: "The Wise Man's Fear", page_num: 870, year_published: 2009)

review_1 = book_9.reviews.create(review_title: "Amazing Story", rating: 4, review_text: "Loved it!", user_id: user_1.id)
review_2 = book_9.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: user_2.id)
review_3 = book_9.reviews.create(review_title: "Worthwhile", rating: 3, review_text: "I enjoyed this book a lot", user_id: user_8.id)
review_4 = book_9.reviews.create(review_title: "Epic read!", rating: 5, review_text: "Loved it!", user_id: user_11.id)
review_5 = book_9.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_id: user_6.id)
review_6 = book_9.reviews.create(review_title: "A little too long", rating: 5, review_text: "I enjoyed this book, but it was long", user_id: user_10.id)

book_10 = author_2.books.create(title: "Whirlwind", page_num: 765, year_published: 1992)

review_18 = book_10.reviews.create(review_title: "Fav Clavell book!", rating: 3, review_text: "Best of the series by far!", user_id: user_2.id)
review_19 = book_10.reviews.create(review_title: "Clavell doesnt disappoint!", rating: 3, review_text: "The writing and descriptions have no match.", user_id: user_9.id)

book_11 = Book.create(title: "East of Eden", page_num: 411, year_published: 1954)

author_9 = book_11.authors.create(name: "John Steinbeck")

book_11.reviews.create(review_title: "Why the popularity?", rating: 3, review_text: "Overrated tale of love and deception", user_id: user_5.id)
book_11.reviews.create(review_title: "Undying love", rating: 4, review_text: "I love this book, everyone should read it.", user_id: user_12.id)
book_11.reviews.create(review_title: "Love and Betrayal", rating: 5, review_text: "I love this book, everyone should read it.", user_id: user_8.id)

book_12 = author_9.books.create(title: "Of Mice and Men", page_num: 201, year_published: 1934)

book_12.reviews.create(review_title: "Amazing Story", rating: 3, review_text: "Loved it!", user_id: user_3.id)
book_12.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: user_8.id)
book_12.reviews.create(review_title: "Worthwhile", rating: 3, review_text: "I enjoyed this book a lot", user_id: user_4.id)
book_12.reviews.create(review_title: "Epic read!", rating: 5, review_text: "Loved it!", user_id: user_9.id)
book_12.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_id: user_12.id)
book_12.reviews.create(review_title: "A little too long", rating: 4, review_text: "I enjoyed this book, but it was long", user_id: user_11.id)

book_13 = author_7.books.create(title: "The Sun Also Rises", page_num: 191, year_published: 1943)

book_13.reviews.create(review_title: "Great Story", rating: 3, review_text: "Loved it!", user_id: user_5.id)
book_13.reviews.create(review_title: "A wartime epic", rating: 4, review_text: "I was entertained throughout", user_id: user_9.id)
book_13.reviews.create(review_title: "Read this book!", rating: 3, review_text: "I enjoyed this book a lot", user_id: user_2.id)
book_13.reviews.create(review_title: "My favorite book", rating: 4, review_text: "Loved it!", user_id: user_11.id)
book_13.reviews.create(review_title: "The best book Ive read in a while", rating: 4, review_text: "I was entertained throughout", user_id: user_4.id)
book_13.reviews.create(review_title: "A little too long", rating: 3, review_text: "I enjoyed this book, but it was long", user_id: user_10.id)

book_14 = author_7.books.create(title: "As the Bell Tolls", page_num: 259, year_published: 1950)

book_15 = author_3.books.create(title: "How To SAVE Your Marraige", page_num: 234, year_published: 2015)
