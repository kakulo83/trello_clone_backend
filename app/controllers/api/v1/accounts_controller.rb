class Api::V1::AccountsController < Api::V1::BaseController
  include ExceptionHandler

  def show
    render json: Account.find(params[:id]),
      serializer: Api::V1::AccountSerializer
  end

  def create
    account = Account.create(account_params)
    render json: account, status: :created,
      serializer: Api::V1::AccountSerializer
  end

  def update
    account = Account.find(params[:id])
    account.update(account_params)
    render json: account, status: :accepted,
      serializer: Api::V1::AccountSerializer
  end

  def destroy; end

  private

  def account_params
    params.require(:account).permit(:name)
  end
end
