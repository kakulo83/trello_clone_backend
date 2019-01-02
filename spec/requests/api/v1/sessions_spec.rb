require 'rails_helper'

RSpec.describe 'POST /login', type: :request do
  let(:url) { '/login' }
  let(:account) { Account.create(name: "test_account") }
  let!(:owner ) { User.create(name: "Mr. Owner",
                             email: "user@test.net",
                             account_id: account.id,
                             password: "foobar12345",
                             password_confirmation: "foobar12345") }


  context "when params are correct" do
    let(:params) do
      {
        session: {
          email: "user@test.net",
          password: "foobar12345"
        }
      }
    end

    before do
      post url, params: params
    end

    it "returns 200" do
      expect(response).to have_http_status(200)
    end

    it "returns a JWT token" do
      expect(JSON.parse(response.body)["token"]).to be_present
    end

    it "returns a valid JWT token" do
      decoded_token = JWTUtil.decode(JSON.parse(response.body)["token"])
      expect(decoded_token['user_id']).to be_present
      expect(decoded_token['role']).to be_present
    end
  end

  context "when login params are incorrect" do
    let(:params) do
      {
        session: {
          email: "",
          password: ""
        }
      }
    end

    it "returns 422 when the email is incorect" do
      params[:session][:email] = "wrong@test.net"
      params[:session][:password] = "foobar12345"
      post url, params: params
      expect(response).to have_http_status(422)
    end

    it "returns 401 when password is incorrect" do
      params[:session][:email] = "user@test.net"
      params[:session][:password] = "wrong_password"
      post url, params: params
      expect(response).to have_http_status(401)
    end
  end


end
