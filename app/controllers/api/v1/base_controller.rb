class Api::V1::BaseController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_request

  attr_reader :current_user, :headers

  private

  def authenticate_request
    @headers = request.headers
    @current_user = user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def user
    begin
      @current_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
      @current_user || errors.add(:token, "Invalid token") && nil
    rescue JWT::DecodeError => e
      render json: {
        success: false,
        errors: ["#{e.message}, Invalid Token"]
      }, status: :unauthorized
    end
  end

  def decoded_auth_token
    @decoded_auth_token ||= JWTUtil.decode(http_auth_header)
  end

  def http_auth_header
    if headers["Authorization"].present?
      return headers["Authorization"].split(' ').last
    else
       render json: {
        success: false,
        errors: ["Missing Authorization Token"],
      }, status: :unauthorized
    end
  end
end
