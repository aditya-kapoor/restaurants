require 'rails_helper'

RSpec.describe RestaurantVisitor, type: :model do
  describe 'Associations' do
    it { should belong_to(:visitor) }
    it { should belong_to(:restaurant) }
  end
end
