module Api::V1
  module Concerns
    module Response
      extend ActiveSupport::Concern

      def json_response(object, object_count = 0, status = :ok)
      	response.headers['X-Total-Count'] = object_count
				response.headers['Access-Control-Expose-Headers'] = 'X-Total-Count'
        render json: object, status: status
      end
    end
  end
end
