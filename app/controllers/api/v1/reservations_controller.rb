module Api
  module V1
    class ReservationsController < Api::V1::BaseController
      before_action :load_restaurant
      before_action :load_reservation, only: :update

      def index
        @reservations = @restaurant.reservations
        render json: @reservations, status: :ok
      end

      def create
        @reservation = @restaurant.reservations.build(permitted_params)
        if @reservation.save
          render json: @reservation, status: :created
        else
          render json: { success: false, errors: @reservation.errors }, status: :unprocessable_entity
        end
      end

      def update
        if @reservation.update(permitted_params)
          render json: @reservation, status: :ok
        else
          render json: { success: false, errors: @reservation.errors }, status: :unprocessable_entity
        end
      end

      private

      def load_restaurant
        @restaurant = Restaurant.find(params[:restaurant_id])
        render json: { error: 'Restaurant Not Found' }, status: :not_found unless @restaurant
      end

      def load_reservation
        @reservation = Reservation.find(params[:id])
        render json: { error: 'Reservation Not Found' }, status: :not_found unless @reservation
      end

      def permitted_params
        required_params.permit(:visitor_id, :table_id, :guest_count, :start_time, :end_time )
      end

      def required_params
        params.require(:reservation)
      end
    end
  end
end
