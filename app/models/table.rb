class Table < ApplicationRecord
  belongs_to :restaurant

  validates :min_guest_capacity, presence: true
end
