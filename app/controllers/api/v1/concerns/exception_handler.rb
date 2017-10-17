module Api::V1
  module Concerns
    module ExceptionHandler
      extend ActiveSupport::Concern

      included do
        rescue_from CustomError do |e|
          json_response({ message: e.message }, 0,:unprocessable_entity)
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          json_response({ message: e.message }, 0, :not_found)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
          json_response({ message: e.message }, 0, :unprocessable_entity)
        end
      end
    end
  end
end
