module Api
  module V1
    class RestaurantSerializer < BaseSerializer
      attributes :id, :email, :name, :phone, :shift_timings
    end
  end
end
