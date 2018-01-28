module Api
  module V1
    class RestaurantsController < Api::V1::BaseController
      before_action :load_restaurant, only: :update

      def create
        @restaurant = Restaurant.new(permitted_params)
        if @restaurant.save
          render json: @restaurant, status: :created
        else
          render json: { success: false, errors: @restaurant.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @restaurant.update(permitted_params)
          render json: @restaurant, status: :ok
        else
          render json: { success: false, errors: @restaurant.errors }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        required_params.permit(:name, :email, :phone, shift_timings: [:name, :start_time, :end_time])
      end

      def required_params
        params.require(:restaurant)
      end

      def load_restaurant
        @restaurant = Restaurant.find(params[:id])
        render json: { errors: 'Restaurant not found.' }, status: :not_found unless @restaurant
      end
    end
  end
end
