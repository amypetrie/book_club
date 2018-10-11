require 'rails_helper'

describe Review, type: :model do

  before(:each) do
    @user_1 = User.create(user_name: "booklover11")
    @user_2 = User.create(user_name: "John Smith")
    @user_3 = User.create(user_name: "Kyle")
    @user_4 = User.create(user_name: "Critic McGibbons")
    @user_5 = User.create(user_name: "George Cormack")

    @book_1 = Book.create(title: "The Name of the Wind", page_num: 570, year_published: 2000)
    @author_1 = @book_1.authors.create(name: "Patrick Rothfuss")

    @review_1 = @book_1.reviews.create(review_title: "Amazing Story", rating: 5, review_text: "Loved it!", user_id: @user_1.id)
    @review_2 = @book_1.reviews.create(review_title: "Pretty good", rating: 4, review_text: "I was entertained throughout", user_id: @user_2.id)
    @review_3 = @book_1.reviews.create(review_title: "Worthwhile", rating: 3, review_text: "I enjoyed this book a lot", user_id: @user_3.id)

    @book_2 = Book.create(title: "Shogun", page_num: 995, year_published: 1968)
    @author_2 = @book_2.authors.create(name: "James Clavell")

    @review_4 = @book_2.reviews.create(review_title: "Epic read!", rating: 2, review_text: "Loved it!", user_id: @user_2.id)
    @review_5 = @book_2.reviews.create(review_title: "The best book ever", rating: 1, review_text: "I was entertained throughout", user_id: @user_4.id)
    @review_6 = @book_2.reviews.create(review_title: "A little too long", rating: 2, review_text: "I enjoyed this book, but it was long", user_id: @user_5.id)

  end

  describe 'Validations' do

    it { should validate_presence_of(:review_title)}
    it { should validate_presence_of(:rating)}
    it { should validate_presence_of(:review_text)}

  end

  describe 'Relationships' do

    it { should belong_to(:book)}
    it { should belong_to(:user)}

  end

  describe 'Review class methods' do
    describe 'avg_rating method' do
      it 'returns average rating of all reviews' do
        avg = Review.avg_rating.round(1)

        expect(avg).to eq 2.8
      end
    end

    describe 'top_reviews method' do
      it 'returns 3 reviews' do
        reviews = Review.top_reviews

        expect(reviews.length).to eq 3
      end

      it 'the first review listed is the highest rated review' do
        review = Review.top_reviews.first

        expect(review).to eq @review_1
      end
    end

    describe 'low_reviews method' do
      it 'returns 3 reviews' do
        reviews = Review.low_reviews

        expect(reviews.length).to eq 3
      end

      it 'the first review listed is the lowest rated review' do
        review = Review.low_reviews.first

        expect(review).to eq @review_5
      end
    end
  end

end
