class Restaurant < ApplicationRecord
  has_many :restaurant_visitors
  has_many :visitors, through: :restaurant_visitors

  validates :name, :phone, :email, presence: true
end
