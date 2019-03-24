class Api::V1::BoardsController < Api::V1::BaseController
  def index
    render json: { boards: @current_user.boards }
  end

  def show
    # TODO Ensure user is authorized to see this board

    if params[:include_cards]
      @board = Board.includes(decks: :cards).find(params[:id])
      render json: @board, include: { decks: { include: :cards }}
    else
      @board = Board.find(params[:id])
      render json: @board
    end
  end

  def create; end

  def update; end

  def destroy; end

  private

  def board_params
    params.require(:board).permit(:name, :account_id)
  end
end
