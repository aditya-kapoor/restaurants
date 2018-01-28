module Api
  module V1
    class VisitorSerializer < BaseSerializer
      attributes :id, :email, :name
    end
  end
end
