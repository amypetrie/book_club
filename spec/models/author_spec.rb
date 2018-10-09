require 'rails_helper'

describe 'Validations' do

  it 'should not be valid without a name' do
    author = Author.create

    expect(author).to_not be_valid
  end

  # it 'should has_many books' do
  #
  # end

end
