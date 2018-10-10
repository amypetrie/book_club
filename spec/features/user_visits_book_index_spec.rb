require 'rails_helper'

describe 'User visits /' do

  before(:each) do
    user_1 = User.create(user_name: "booklover11")
    user_2 = User.create(user_name: "John Smith")
    user_3 = User.create(user_name: "Kyle")
    user_4 = User.create(user_name: "Critic McGibbons")

    @book_1 = Book.create(
      title: "The Name of the Wind", page_num: 570, year_published: 2000)
    @author_1 = @book_1.authors.create(name: "Patrick Rothfuss")

    @review_1 = @book_1.reviews.create(
      review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_id: user_1.id)
    @review_2 = @book_1.reviews.create(
      review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: user_2.id)
    @review_3 = @book_1.reviews.create(
      review_title: "Worthwhile", rating: 4, review_text: "I enjoyed this book a lot", user_id: "Kyle")

    @book_2 = Book.create(
      title: "Shogun", page_num: 995, year_published: 1968)
    @author_2 = @book_2.authors.create(
      name: "James Clavell")
    @review_4 = @book_2.reviews.create(
      review_title: "Epic read!", rating: 5, review_text: "Loved it!", user_id: user_3.id)
    @review_5 = @book_2.reviews.create(
      review_title: "The best book ever", rating: 4, review_text: "I was entertained throughout", user_id: user_4.id)
    @review_6 = @book_2.reviews.create(
      review_title: "A little too long", rating: 3, review_text: "I enjoyed this book, but it was long", user_id: user_1.id)
  end

  describe "they should see books with the book's" do

    it "title" do
      visit '/books'

      expect(page).to have_content(@book_1.title)
      expect(page).to have_content(@book_2.title)
    end

    it "page_num" do
      visit '/books'

      expect(page).to have_content(
      "Pages: #{@book_2.page_num}"
    )
      expect(page).to have_content(
        "Pages: #{@book_2.page_num}"
      )
    end

    it "year_published" do
      visit '/books'

      expect(page).to have_content(
        "Published: #{@book_2.year_published}"
      )
      expect(page).to have_content(
        "Published: #{@book_2.year_published}"
      )
    end

    it "authors" do
      visit '/books'

      book_1_authors = @book_1.authors.pluck(:name).join(', ')
      book_2_authors = @book_2.authors.pluck(:name).join(', ')

      expect(page).to have_content(book_1_authors)
      expect(page).to have_content(book_2_authors)
    end

    it 'average rating' do
      visit '/books'

      expect(page).to have_content("(#{@book_1.reviews.avg_rating})")
      expect(page).to have_content("(#{@book_2.reviews.avg_rating})")
    end

    it 'number of reviews' do
      visit '/books'

      expect(page).to have_content("#{@book_1.reviews.count} Reviews")
      expect(page).to have_content("#{@book_2.reviews.count} Reviews")
    end

  end

end
