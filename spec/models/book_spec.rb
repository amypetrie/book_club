require 'rails_helper'

describe 'Validations' do

  it 'should not be valid without a title' do
    book = Book.create

    expect(book).to_not be_valid
  end

  it 'should not be valid without a page_num' do
    book = Book.create(title:'Book 1')

    expect(book).to_not be_valid
  end

  it 'should not be valid without a year_published' do
    book = Book.create(title:'Book 1', page_num:350)

    expect(book).to_not be_valid
  end

  it 'should has_many authors' do
    association = Book.reflect_on_association(:authors)
    expect(association.macro).to eq :has_many
  end

end
