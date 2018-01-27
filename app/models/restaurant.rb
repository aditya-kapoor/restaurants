class Restaurant < ApplicationRecord
  validates :name, :phone, :email, presence: true
end
