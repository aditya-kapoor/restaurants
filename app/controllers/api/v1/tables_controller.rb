module Api
  module V1
    class TablesController < Api::V1::BaseController
      before_action :load_restaurant

      def create
        @table = @restaurant.tables.build(permitted_params)
        if @table.save
          render json: @table, status: :created
        else
          render json: { success: false, errors: @table.errors }, status: :unprocessable_entity
        end
      end

      private

      def load_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        render json: { error: 'Restaurant Not Found' }, status: :not_found unless @restaurant
      end

      def permitted_params
        required_params.permit(:name, :min_guest_capacity, :max_guest_capacity)
      end

      def required_params
        params.require(:table)
      end
    end
  end
end
