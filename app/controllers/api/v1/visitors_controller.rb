module Api
  module V1
    class VisitorsController < Api::V1::BaseController
      def create
        @visitor = Visitor.new(permitted_params)
        if @visitor.save
          render json: @visitor, status: :created
        else
          render json: { success: false, errors: @visitor.errors }, status: :unprocessable_entity
        end
      end

      private

      def permitted_params
        required_params.permit(:name, :email)
      end

      def required_params
        params.require(:visitor)
      end
    end
  end
end
