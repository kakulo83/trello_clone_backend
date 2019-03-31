require 'rails_helper'

RSpec.describe Api::V1::BoardsController, type: :controller do
  let(:account1) { create(:account_with_boards) }
  let(:account2) { create(:account_with_boards) }
  let(:owner) { create(:user, :owner, account: account1) }
  let(:admin) { create(:user, :admin, account: account1) }
  let(:board1) { create(:board, account: account1) }
  let(:board2) { create(:board, account: account1) }
  let(:board_membership) { BoardMembership.create(user: owner, board: board) }

  def authenticated_header(user)
    token = JWTUtil.encode({ user_id: owner.id, role: owner.role })
    { "Authorization": token }
  end

  describe "GET #index" do
    context "unauthenticated" do
      it "should return the request with NO authentication header", :aggregate_failures do
        # get :index
        # expect(response.status).to eq(401)
         expect{
           get :index
         }.to raise_error.with_message("Authorization Header Missing")
      end
    end

    context "authenticated" do
      it "should return only the users boards", :aggregate_failures do
        request.headers.merge! authenticated_header(:owner)
        get :index

        json_response = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(response.content_type).to eq("application/json")
        expect(json_response).to have_key("boards")
      end
    end

    context "authorized" do

    end
  end

  describe "GET #show" do
    context "unauthenticated" do
      it "should return the request with NO authentication header" do
        pending "add specs"
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "authenticated", :aggregate_failures do

    end
  end
end
