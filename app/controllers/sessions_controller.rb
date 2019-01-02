class SessionsController < ActionController::Base
  skip_before_action :verify_authenticity_token, raise: false

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      if user.authenticate(params[:session][:password])
        token = JWTUtil.encode({ user_id: user.id, role: user.role })
        render json: {
          status: :ok,
          token: token
        }, status: :ok
      else
        render json: {
          status: 401,
          errors: ["Password incorrect"],
          code: "incorrect_password"
        }, status: :unauthorized
      end
    else
      render json: {
        status: 422,
        errors: ["Cannot find User associated with #{params[:session][:email]}"],
        code: "user_not_found"
      }, status: :unprocessable_entity
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
