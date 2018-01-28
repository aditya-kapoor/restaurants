require 'rails_helper'

RSpec.describe Table, type: :model do
  describe 'Associations' do
    it { should have_many(:reservations) }
    it { should belong_to(:restaurant) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:min_guest_capacity) }
  end
end
