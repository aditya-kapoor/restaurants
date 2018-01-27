class Restaurant < ApplicationRecord
  has_many :restaurant_visitors
  has_many :visitors, through: :restaurant_visitors
  has_many :tables

  validates :name, :phone, :email, presence: true
end
