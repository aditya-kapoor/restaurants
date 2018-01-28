require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'Associations' do
    it { should belong_to(:restaurant) }
    it { should belong_to(:table) }
    it { should belong_to(:visitor) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:guest_count) }
    it { should validate_presence_of(:start_time) }
    it { should validate_presence_of(:end_time) }

    context 'Capacity' do
      let(:restaurant) { FactoryGirl.create(:restaurant) }
      let(:table) { FactoryGirl.create(:table, restaurant: restaurant) }
      let(:visitor) { FactoryGirl.create(:visitor) }
      let(:reservation) { FactoryGirl.build(:reservation, table: table, restaurant: restaurant, visitor: visitor) }

      context 'when guest capacity is less then table min' do
        before { reservation.guest_count = table.min_guest_capacity - 1; reservation.valid? }
        it { expect(reservation.errors[:guest_count]).to eq(["should be greater than #{table.min_guest_capacity}"]) }
      end

      context 'when guest capacity is greater then table min' do
        before { reservation.guest_count = table.max_guest_capacity + 1; reservation.valid? }
        it { expect(reservation.errors[:guest_count]).to eq(["should be less than #{table.max_guest_capacity}"]) }
      end

      context 'when guest capacity is within the table range' do
        before { reservation.guest_count = 6; reservation.valid? }
        it { expect(reservation.errors[:guest_count]).to eq([]) }
      end
    end

    context 'Shift Timings' do
      let(:restaurant) { FactoryGirl.create(:restaurant) }
      let(:table) { FactoryGirl.create(:table, restaurant: restaurant) }
      let(:visitor) { FactoryGirl.create(:visitor) }
      let(:reservation) { FactoryGirl.build(:reservation, table: table, restaurant: restaurant, visitor: visitor) }
      context 'when within the restaurant shift' do
        before { reservation.valid? }
        it { expect(reservation.errors[:base]).to eq([]) }
      end

      context 'when not in the restaurant shift' do
        before do
          reservation.start_time = DateTime.current.beginning_of_day + 6.hours
          reservation.end_time = DateTime.current.beginning_of_day + 10.hours
          reservation.valid?
        end
        it { expect(reservation.errors[:base]).to eq(["Reservation doesn't lie in the restaurant shift."]) }
      end
    end
  end
end
