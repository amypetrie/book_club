require 'rails_helper'

describe 'User visits /books' do

  before(:each) do
    @user_1 = User.create(user_name: "booklover11")
    @user_2 = User.create(user_name: "John Smith")
    @user_3 = User.create(user_name: "Kyle")
    @user_4 = User.create(user_name: "Critic McGibbons")
    @user_5 = User.create(user_name: "George Cormack")
    @user_6 = User.create(user_name: "unhappy camper")
    @user_7 = User.create(user_name: "Susan McPhalen")
    @user_8 = User.create(user_name: "bronte_fan_1")
    @user_9 = User.create(user_name: "i_love_books_98")
    @user_10 = User.create(user_name: "Amy Petrie")
    @user_11 = User.create(user_name: "Tim Fell")
    @user_12 = User.create(user_name: "Tony Malone")

    @book_1 = Book.create(title: "The Name of the Wind", page_num: 570, year_published: 2000)
    @author_1 = @book_1.authors.create(name: "Patrick Rothfuss")

    @review_1 = @book_1.reviews.create(review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_id: @user_1.id)
    @review_2 = @book_1.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: @user_2.id)
    @review_3 = @book_1.reviews.create(review_title: "Worthwhile", rating: 4, review_text: "I enjoyed this book a lot", user_id: @user_3.id)

    @book_2 = Book.create(title: "Shogun", page_num: 995, year_published: 1968)
    @author_2 = @book_2.authors.create(name: "James Clavell")

    @review_4 = @book_2.reviews.create(review_title: "Epic read!", rating: 5, review_text: "Loved it!", user_id: @user_4.id)
    @review_5 = @book_2.reviews.create(review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_id: @user_12.id)
    @review_6 = @book_2.reviews.create(review_title: "A little too long", rating: 3, review_text: "I enjoyed this book, but it was long", user_id: @user_5.id)

    @book_3 = Book.create(title: "How To Help Your Marraige", page_num: 234, year_published: 1015)
    @author_3 = @book_3.authors.create(name: "Dr. Brad Smith")
    @author_4 = @book_3.authors.create(name: "Dr. Angelina Smith")

    @review_7 = @book_3.reviews.create(review_title: "Not helpful", rating: 1, review_text: "This book was contrite and trivial.", user_id: @user_6.id)

    @book_4 = Book.create(title: "The Great Gatsby", page_num: 301, year_published: 1925)
    @author_5 = @book_4.authors.create(name: "F. Scott Fitzgerald")

    @review_10 = @book_4.reviews.create(review_title: "Not my favorite", rating: 3, review_text: "The love story was sad and had a bad ending", user_id: @user_9.id)
    @review_11 = @book_4.reviews.create(review_title: "Themes that last the ages", rating: 4, review_text: "I love this book, everyone should read it.", user_id: @user_12.id)
    @review_12 = @book_4.reviews.create(review_title: "Rich and nostalgic", rating: 5, review_text: "The authors appear to not know how to write.", user_id: @user_5.id)

    @book_5 = Book.create(title: "Wuthering Heights", page_num: 348, year_published: 1890)
    @author_6 = @book_5.authors.create(name: "Emily Bronte")

    @review_13 = @book_5.reviews.create(review_title: "Why the popularity?", rating: 3, review_text: "Overrated tale of love and deception", user_id: @user_5.id)
    @review_14 = @book_5.reviews.create(review_title: "Undying love", rating: 5, review_text: "I love this book, everyone should read it.", user_id: @user_12.id)
    @review_14 = @book_5.reviews.create(review_title: "Love and Betrayal", rating: 5, review_text: "I love this book, everyone should read it.", user_id: @user_8.id)

    @book_6 = Book.create(title: "Bad Omens", page_num: 551, year_published: 2007)
    @author_7 = @book_6.authors.create(name: "Stephen King")
    @author_8 = @book_6.authors.create(name: "Peter Straub")

    @review_15 = @book_6.reviews.create(review_title: "Scary read!", rating: 3, review_text: "It was scary, but the pace was too slow.", user_id: @user_8.id)
    @review_16 = @book_6.reviews.create(review_title: "NOT scary", rating: 2, review_text: "I wasnt scared in the slightest", user_id: @user_1.id)
    @review_17 = @book_6.reviews.create(review_title: "Mediocre", rating: 3, review_text: "Not up to par with other King books", user_id: @user_3.id)

    @book_7 = @author_2.books.create(title: "Tai-Pan", page_num: 1081, year_published: 1985)

    @review_18 = @book_7.reviews.create(review_title: "Fav Clavell book!", rating: 5, review_text: "Best of the series by far!", user_id: @user_8.id)
    @review_19 = @book_7.reviews.create(review_title: "Clavell doesnt disappoint!", rating: 5, review_text: "The writing and descriptions have no match.", user_id: @user_12.id)
    @review_23 = @book_7.reviews.create(review_title: "Fav Clavell book!", rating: 5, review_text: "Best of the series by far!", user_id: @user_9.id)
    @review_24 = @book_7.reviews.create(review_title: "Clavell doesnt disappoint!", rating: 5, review_text: "The writing and descriptions have no match.", user_id: @user_10.id)
    @review_25 = @book_7.reviews.create(review_title: "Fav Clavell book!", rating: 5, review_text: "Best of the series by far!", user_id: @user_11.id)
    @review_26 = @book_7.reviews.create(review_title: "Clavell doesnt disappoint!", rating: 5, review_text: "The writing and descriptions have no match.", user_id: @user_7.id)

    @book_8 = @author_2.books.create(title: "Noble House", page_num: 976, year_published: 1989)
    @review_20 = @book_8.reviews.create(review_title: "Left me speechless", rating: 5, review_text: "Cant wait to read again!", user_id: @user_10.id)
    @review_21 = @book_8.reviews.create(review_title: "Didnt enjoy that much", rating: 2, review_text: "Way too long, should have been shorter.", user_id: @user_11.id)
    @review_22 = @book_8.reviews.create(review_title: "The best!!", rating: 5, review_text: "Super great!", user_id: @user_9.id)
  end

  describe 'user clicks on button to sort by page_num in ascending order' do
    visit '/books'

    within(".page_num_links")
    click_link "ASC"

    expect(current_path).to eq("/books")
  end
