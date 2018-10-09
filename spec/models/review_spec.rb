require 'rails_helper'

describe 'Validations' do

  it 'should not be valid without a title' do
    review = Review.create

    expect(review).to_not be_valid
  end

  it 'should not be valid without a rating' do
    review = Review.create(title:'Review 1')

    expect(review).to_not be_valid
  end

  it 'should not be valid without a review_text' do
    review = Review.create(title:'Review 1', rating:2)

    expect(review).to_not be_valid
  end

  it 'should not be valid without a book_id' do
    review = Review.create(title:'Review 1', rating:2, review_text: 'Twas Terrible!')

    expect(review).to_not be_valid
  end

  it 'should not be valid without a user_id' do
    review = Review.create(title:'Review 1', rating:2, review_text: 'Twas Terrible!', book_id:1)

    expect(review).to_not be_valid
  end

  it 'should belongs_to book' do
    association = Review.reflect_on_association(:book)
    expect(association.macro).to eq :belongs_to
  end

  it 'should belongs_to user' do
    association = Review.reflect_on_association(:user)
    expect(association.macro).to eq :belongs_to
  end

end
