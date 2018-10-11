require 'rails_helper'

describe Review, type: :model do

  describe 'Validations' do

    it { should validate_presence_of(:review_title)}
    it { should validate_presence_of(:rating)}
    it { should validate_presence_of(:review_text)}

  end

  describe 'Relationships' do

    it { should belong_to(:book)}
    it { should belong_to(:user)}

  end

end
