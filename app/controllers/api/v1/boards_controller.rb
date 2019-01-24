class Api::V1::BoardsController < Api::V1::BaseController
  def index
    render json: { boards: Board.all }
  end

  def show; end

  def create; end

  def update; end

  def destroy; end

  private

  def board_params
    params.require(:board).permit(:name, :account_id)
  end
end
