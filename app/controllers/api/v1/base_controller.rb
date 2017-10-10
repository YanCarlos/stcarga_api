module Api::V1
  class BaseController < ApplicationController
    include Concerns::Response
    include Concerns::ExceptionHandler

    before_action :authenticate_user!

    def authenticate_user!
      return true if authenticate_token
      render json: { errors: [ { detail: 'Access denied' } ] }, status: 401
    end

    def current_user
      @current_user || authenticate_token
    end

    def logout
      begin
        current_user.invalidate_api_token
        render json: 'success', status: 200
      rescue => e
        logger.error e.message
        logger.error e.backtrace.join('\n')
        render json: "There was an error: #{e.message} while trying to logout your account.", status: 500
      end
    end

    private

    def authenticate_token
      User.find_by(token: request.headers[:HTTP_USER_TOKEN])
    end
  end
end
