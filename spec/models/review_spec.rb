require 'rails_helper'

describe Review, type: :model do

  describe 'Validations' do

    it { should validate_presence_of(:review_title)}
    it { should validate_presence_of(:rating)}
    it { should validate_presence_of(:review_text)}
    it { should validate_presence_of(:book_id)}
    it { should validate_presence_of(:user_id)}

  end

  describe 'Relationships' do

    it { should belong_to(:book)}

  end

end
