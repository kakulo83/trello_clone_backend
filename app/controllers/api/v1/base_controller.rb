class Api::V1::BaseController < ActionController::Base
  include ExceptionHandler

  skip_before_action :verify_authenticity_token, raise: false
  before_action :authenticate_request

  attr_reader :current_user, :headers

  def check_token
    render json: :accepted
  end

  private

  def authenticate_request
    @current_user = user
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  def user
    @headers = request.headers
    @current_user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
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
end
