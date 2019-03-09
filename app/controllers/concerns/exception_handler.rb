module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthorizationHeaderMissing < StandardError; end

  included do
    rescue_from ActiveRecord::RecordNotFound do |e|
      render json: {
        status: 404,
        error: e.message,
        code: "record_not_found"
      }, status: :not_found
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: {
        status: 422,
        error: e.message,
        code: "invalid_record"
      }, status: :unprocessable_entity
    end

    rescue_from ActionController::ParameterMissing do |e|
      render json: {
        status: 422,
        error: e.message,
        code: "missing_required_data"
      }, status: :unprocessable_entity
    end

    rescue_from JWT::DecodeError do |e|
      render json: {
        status: 500,
        error: "Invalid token, #{e.message}",
        code: "jwt_decoding_error"
      }, status: :internal_server_error
    end

    rescue_from AuthorizationHeaderMissing do |e|
      render json: {
        status: 401,
        error: e.message,
        code: "authorization_header_missing"
      }, status: :unauthorized
    end
  end
end
