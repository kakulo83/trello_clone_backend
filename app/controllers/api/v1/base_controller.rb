class Api::V1::BaseController < ActionController::Base
  # include ExceptionHandler
  include AuthorizationPolicy

  class AuthorizationHeaderMissing < StandardError; end
  class NoAuthorization < StandardError; end

  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_request
  before_action :current_resource, only: [:show, :update, :destroy]
  before_action :authorize_request, only: [:show, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from JWT::DecodeError, with: :jwt_decoding_error
  rescue_from AuthorizationHeaderMissing, with: :authorization_header_missing
  rescue_from NoAuthorization, with: :no_authorization

  attr_reader :headers

  def check_token
    render json: :accepted
  end

  private

    def authenticate_request
      @current_user = current_user
      @current_account = @current_user&.account
      render json: { error: 'Not Authorized' }, status: 401 unless @current_user
    end

    def authorize_request
      raise NoAuthorization unless is_request_authorized? action_name, current_resource, current_user
    end

    def current_resource
      @current_resource ||= controller_name.classify.constantize.find(params[:id])
    end

    def current_user
      @headers = request.headers
      @current_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    end

    def current_account
      @current_user.account
    end

    def decoded_auth_token
      @decoded_auth_token ||= JWTUtil.decode(http_auth_header)
    end

    def http_auth_header
      if headers["Authorization"].present?
        return headers["Authorization"].split(' ').last
      else
        raise AuthorizationHeaderMissing.new("Authorization Header Missing")
      end
    end

  protected

    def record_not_found(exception)
      render json: {
        status: 404,
        error: exception.message,
        code: "record_not_found"
      }, status: :not_found
    end

    def record_invalid(exception)
      render json: {
        status: 422,
        error: exception.message,
        code: "invalid_record"
      }, status: :unprocessable_entity
    end

    def parameter_missing(exception)
      render json: {
        status: 422,
        error: exception.message,
        code: "missing_required_data"
      }, status: :unprocessable_entity
    end

    def jwt_decoding_error(exception)
      if e.exception.class == JWT::ExpiredSignature
        render json: {
          status: 401,
          error: "Invalid token, #{exception.message}",
          code: "unauthorized"
        }, status: :unauthorized
      else
        render json: {
          status: 500,
          error: "Invalid token, #{exception.message}",
          code: "jwt_decoding_error"
        }, status: :internal_server_error
      end
    end

    def authorization_header_missing(exception)
      render json: {
        status: 401,
        error: exception.message,
        code: "authorization_header_missing"
      }, status: :unauthorized
    end

    def no_authorization(exception)
      render json: {
        status: 401,
        error: exception.message,
        code: "authorization_access_to_resource"
      }, status: :unauthorized
    end
end
