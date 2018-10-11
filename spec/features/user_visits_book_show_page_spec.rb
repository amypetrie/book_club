require 'rails_helper'

describe 'as a visitor' do

  before(:each) do
    @user_1 = User.create(user_name: "booklover11")
    @user_2 = User.create(user_name: "John Smith")
    @user_3 = User.create(user_name: "Kyle")
    @user_4 = User.create(user_name: "Critic McGibbons")
    @user_5 = User.create(user_name: "Amy")
    @user_6 = User.create(user_name: "Tim")
    @user_7 = User.create(user_name: "Carol")

    @book_1 = Book.create(title: "The Name of the Wind", page_num: 570, year_published: 2000)
    @author_1 = @book_1.authors.create(name: "Patrick Rothfuss")

    @review_1 = @book_1.reviews.create(review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_id: @user_1.id)
    @review_2 = @book_1.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: @user_2.id)
    @review_3 = @book_1.reviews.create(review_title: "Worthwhile", rating: 3, review_text: "I enjoyed this book a lot", user_id: @user_3.id)
    @review_4 = @book_1.reviews.create(review_title: "Epic read!", rating: 2, review_text: "Loved it!", user_id: @user_4.id)
    @review_5 = @book_1.reviews.create(review_title: "The best book ever", rating: 1, review_text: "I was entertained throughout", user_id: @user_1.id)
    @review_6 = @book_1.reviews.create(review_title: "A little too long", rating: 2, review_text: "I enjoyed this book, but it was long", user_id: @user_2.id)

    @book_2 = Book.create(title: "Shogun", page_num: 995, year_published: 1968)
    @author_2 = @book_2.authors.create(name: "James Clavell")

    @review_7 = @book_2.reviews.create(review_title: "Test1", rating: 5, review_text: "Loved it!", user_id: @user_5.id)
    @review_8 = @book_2.reviews.create(review_title: "Test2", rating: 4, review_text: "I was entertained throughout", user_id: @user_6.id)
    @review_9 = @book_2.reviews.create(review_title: "Test3", rating: 3, review_text: "I enjoyed this book, but it was long", user_id: @user_7.id)
  end

  describe 'when visitor visits book show page for book id 1' do

    it 'should see title for book id 1' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to have_content(@book_1.title)
      end
    end

    it 'should see author(s) for book id 1' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to have_content(@book_1.authors.author_names)
      end
    end

    it 'should see page_num for book id 1' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to have_content(@book_1.page_num)
      end
    end

    it 'should see year_published for book id 1' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to have_content(@book_1.year_published)
      end
    end

    it 'should see total ratings for book id 1' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to have_content(@book_1.reviews.count)
      end
    end

    it 'should not see title for book id 2' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to_not have_content(@book_2.title)
      end
    end

    it 'should not see author(s) for book id 2' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to_not have_content(@book_2.authors.author_names)
      end
    end

    it 'should not see page_num for book id 2' do
      visit "/books/#{@book_1.id}"

      within(".book") do
      expect(page).to_not have_content(@book_2.page_num)
      end
    end

    it 'should see names of top three reviews for book 1 in top reviews' do
      visit "/books/#{@book_1.id}"

      within(".top_reviews") do
      expect(page).to have_content(@review_1.review_title)
      expect(page).to have_content(@review_2.review_title)
      expect(page).to have_content(@review_3.review_title)
      end
    end

    it 'should not see review_text of top three reviews for book 1 in top reviews' do
      visit "/books/#{@book_1.id}"

      within(".top_reviews") do
      expect(page).to_not have_content(@review_1.review_text)
      expect(page).to_not have_content(@review_2.review_text)
      expect(page).to_not have_content(@review_3.review_text)
      end
    end

    it 'should see user_names of top three reviews for book 1 in top reviews' do
      visit "/books/#{@book_1.id}"

      within(".top_reviews") do
      expect(page).to have_content(@user_1.user_name)
      expect(page).to have_content(@user_2.user_name)
      expect(page).to have_content(@user_3.user_name)
      end
    end

    it 'should not see names of bottom three reviews for book 1 in top reviews' do
      visit "/books/#{@book_1.id}"

      within(".top_reviews") do
      expect(page).to_not have_content(@review_4.review_title)
      expect(page).to_not have_content(@review_5.review_title)
      expect(page).to_not have_content(@review_6.review_title)
      end
    end

    it 'should see names of bottom three reviews for book 1 in low reviews' do
      visit "/books/#{@book_1.id}"

      within(".low_reviews") do
      expect(page).to have_content(@review_4.review_title)
      expect(page).to have_content(@review_5.review_title)
      expect(page).to have_content(@review_6.review_title)
      end
    end

    it 'should not see names of top three reviews for book 1 in low reviews' do
      visit "/books/#{@book_1.id}"

      within(".low_reviews") do
      expect(page).to_not have_content(@review_1.review_title)
      expect(page).to_not have_content(@review_2.review_title)
      expect(page).to_not have_content(@review_3.review_title)
      end
    end

    it 'should not see names of reviews for book 2' do
      visit "/books/#{@book_1.id}"

      within(".all_reviews") do
      expect(page).to_not have_content(@review_7.review_title)
      expect(page).to_not have_content(@review_8.review_title)
      expect(page).to_not have_content(@review_9.review_title)
      end
    end

    it 'should show all review titles for book 1' do
      visit "/books/#{@book_1.id}"

      within(".all_reviews") do
      expect(page).to have_content(@review_1.review_title)
      expect(page).to have_content(@review_2.review_title)
      expect(page).to have_content(@review_3.review_title)
      expect(page).to have_content(@review_4.review_title)
      expect(page).to have_content(@review_5.review_title)
      expect(page).to have_content(@review_6.review_title)
      end
    end

    it 'should show all user_names for book 1 reviewers' do
      visit "/books/#{@book_1.id}"

      within(".all_reviews") do
      expect(page).to have_content(@user_1.user_name)
      expect(page).to have_content(@user_2.user_name)
      expect(page).to have_content(@user_3.user_name)
      expect(page).to have_content(@user_4.user_name)
      end
    end

    it 'should not show user_names reviewers who havent submitted a book 1 review' do
      visit "/books/#{@book_1.id}"

      within(".all_reviews") do
      expect(page).to_not have_content(@user_5.user_name)
      expect(page).to_not have_content(@user_6.user_name)
      expect(page).to_not have_content(@user_7.user_name)
      end
    end

  end
end
