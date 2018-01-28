class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations

  validates :min_guest_capacity, presence: true
end
