class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :table
  belongs_to :visitor

  validates :guest_count, :start_time, :end_time, presence: true
  validates_with GuestCapacityValidator
  validates_with ShiftTimingsValidator

  after_create :inform_restaurant, :inform_visitor

  private

  def inform_restaurant
    RestaurantMailer.new_reservation(id).deliver_later
  end

  def inform_visitor
    VisitorMailer.reservation_confirmed(id).deliver_later
  end
end
