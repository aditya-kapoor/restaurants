class Visitor < ApplicationRecord
  has_many :restaurant_visitors
  has_many :restaurants, through: :restaurant_visitors

  validates :name, :email, presence: true
end
