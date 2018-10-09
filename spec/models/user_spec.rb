require 'rails_helper'

describe 'Validations' do

  it 'should not be valid without a name' do
    user = User.create

    expect(user).to_not be_valid
  end

  it 'should has_many reviews' do
    association = User.reflect_on_association(:reviews)
    expect(association.macro).to eq :has_many
  end

end
