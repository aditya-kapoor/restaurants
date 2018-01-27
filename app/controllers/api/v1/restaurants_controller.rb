module Api
  module V1
    class RestaurantsController < Api::V1::BaseController
      def create
        @restaurant = Restaurant.new(permitted_params)
        if @restaurant.save
          render json: @restaurant, status: :created
        else
          render json: { success: false, errors: @restaurant.errors }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        required_params.permit(:name, :email, :phone)
      end

      def required_params
        params.require(:restaurant)
      end
    end
  end
end
