module Api
  module V1
    class TableSerializer < BaseSerializer
      attributes :id, :name, :min_guest_capacity, :max_guest_capacity, :restaurant_id
    end
  end
end

