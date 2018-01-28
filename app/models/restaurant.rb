class Restaurant < ApplicationRecord
  EMAIL_REGEXP = /\A[^@\s]+@[^@\s]+\z/

  has_many :restaurant_visitors
  has_many :visitors, through: :restaurant_visitors
  has_many :tables
  has_many :reservations

  phony_normalize :phone, default_country_code: 'MY'
  serialize :shift_timings, Array

  validates :name, :phone, :email, presence: true
  validates :email, format: { with: EMAIL_REGEXP }, allow_blank: true
  validates_plausible_phone :phone, country_code: 'MY', message: 'is invalid.'
end
