require 'rails_helper'

describe 'Validations' do

  it 'should not be valid without a review title' do
    review = Review.create

    expect(review).to_not be_valid
  end

  it 'should not be valid without a rating' do
    review = Review.create(review_title:'Review 1')

    expect(review).to_not be_valid
  end

  it 'should not be valid without a review_text' do
    review = Review.create(review_title:'Review 1', rating:2)

    expect(review).to_not be_valid
  end

  it 'should not be valid without a book_id' do
    review = Review.create(review_title:'Review 1', rating:2, review_text: 'Twas Terrible!')

    expect(review).to_not be_valid
  end

  it 'should not be valid without a user_name' do
    review = Review.create(review_title:'Review 1', rating:2, review_text: 'Twas Terrible!')

    expect(review).to_not be_valid
  end

  it 'should belongs_to book' do
    association = Review.reflect_on_association(:book)
    expect(association.macro).to eq :belongs_to
  end

end
