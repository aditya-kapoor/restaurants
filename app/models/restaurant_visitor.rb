class RestaurantVisitor < ApplicationRecord
  belongs_to :restaurant
  belongs_to :visitor
end
