module Api
  module V1
    class ReservationSerializer < BaseSerializer
      attributes :id, :guest_count, :start_time, :guest_name, :table_name

      def start_time
        object.start_time.strftime("%H:%M %p")
      end

      def guest_name
        object.visitor.name
      end

      def table_name
        object.table.name
      end
    end
  end
end
