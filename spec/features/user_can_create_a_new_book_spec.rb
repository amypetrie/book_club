require 'rails_helper'

describe 'user visits book index page' do
  it 'user can create a new book' do
    visit new_book_path

    title = "test book"
    page_num = 231
    year_published = 2018
    authors = "Amy Petrie, Tim Fell"

    fill_in 'book[title]', with: title
    fill_in 'book[page_num]', with: page_num
    fill_in 'book[year_published]', with: year_published
    fill_in 'book[authors]', with: authors

    click_on "Create Book"

    expect(page).to have_content("Test Book")
    expect(page).to have_content(page_num)
    expect(page).to have_content(year_published)
    expect(page).to have_content("Amy Petrie")
    expect(page).to have_content("Tim Fell")
  end

  describe 'user can create a book for an existing author' do
    it 'should create the book under existing author' do
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

      visit new_book_path

      fill_in 'book[title]', with: "Test"
      fill_in 'book[page_num]', with: 444
      fill_in 'book[year_published]', with: 1234
      fill_in 'book[authors]', with: author_1.name

      click_on "Create Book"

      visit author_path(author_1)

      expect(page).to have_content("Test")
      expect(page).to have_content(444)
    end
  end
  describe 'user cant create a book if it already exists' do
    it 'will be redirected to the new book form' do
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

      visit new_book_path

      fill_in 'book[title]', with: "Shogun"
      fill_in 'book[page_num]', with: 444
      fill_in 'book[year_published]', with: 1234
      fill_in 'book[authors]', with: author_1.name

      click_on "Create Book"
      expect(current_path).to eq new_book_path
    end
  end
end
