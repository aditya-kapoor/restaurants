require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe 'Constants' do
    it { expect(Restaurant::EMAIL_REGEXP).to eq(/\A[^@\s]+@[^@\s]+\z/) }
  end

  describe 'Associations' do
    it { should have_many(:restaurant_visitors) }
    it { should have_many(:visitors).through(:restaurant_visitors) }
    it { should have_many(:tables) }
    it { should have_many(:reservations) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:email) }
  end
end
