module ExceptionHandler
  extend ActiveSupport::Concern

  class AuthorizationHeaderMissing < StandardError; end
  class NoAuthorization < StandardError; end

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
      if e.exception.class == JWT::ExpiredSignature
        render json: {
          status: 401,
          error: "Invalid token, #{e.message}",
          code: "unauthorized"
        }, status: :unauthorized
      else
        render json: {
          status: 500,
          error: "Invalid token, #{e.message}",
          code: "jwt_decoding_error"
        }, status: :internal_server_error
      end
    end

    rescue_from AuthorizationHeaderMissing do |e|
      render json: {
        status: 401,
        error: e.message,
        code: "authorization_header_missing"
      }, status: :unauthorized
    end

    rescue_from NoAuthorization do |e|
      render json: {
        status: 401,
        error: e.message,
        code: "authorization_access_to_resource"
      }, status: :unauthorized
    end
  end
end
