class SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user.authenticate(params[:session][:password])
        token = JWTUtil.encode({ user_id: user.id, role: user.role })
        render json: {
          success: true,
          token: token
        }, status: :ok
      else
        render json: {
          success: false,
          errors: ["Password incorrect"]
        }, status: :unauthorized
      end
    else
      render json: {
        success: false,
        errors: ["Cannot find User associated with #{params[:session][:email]}"]
      }, status: :unauthorized
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
