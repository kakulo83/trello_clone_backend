# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  account_id :integer
#  role       :integer          default("user")
#  integer    :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  before(:context) do
    @account = Account.create!(name: "test_account", owner: @owner)
    @owner = User.create!(name: "Mr Owner", email: "owner@test.net", role: :owner, account_id: @account.id )
    # admin = User.new(name: "Mr Admin", email: "admin@test.net", account_id: account.id )
    #board = Board.new(name: "Board 1", account_id: account.id )
  end

  describe "when the User is not an Owner or Admin" do
    subject(:user) { User.create(name: "Mr User", email: "user@test.net", account_id: @account.id ) }

    it "has a name" do
      expect(subject.name).to eq("Mr User")
    end

    it "has an email" do
      expect(subject.email).to eq("user@test.net")
    end

    it "is not an admin or owner", :aggregate_failures do
      expect(subject.admin?).to be_falsey
      expect(subject.owner?).to be_falsey
      expect(subject.user?).to be true
    end

    it { should belong_to(:account) }
    it { should have_many(:boards) }
  end

  describe "when the user is an Owner" do
    subject(:owner) { User.create(name: "Mr Owner", email: "owner@test.net", account_id: @account.id, role: :owner) }

    it "is an owner" do
      expect(subject.owner?).to be true
    end
  end

  describe "when the user is an Admin" do
    pending "add some specs"
  end
end
