require 'rails_helper'

RSpec.describe Visitor, type: :model do
  describe 'Associations' do
    it { should have_many(:restaurant_visitors) }
    it { should have_many(:restaurants).through(:restaurant_visitors) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
