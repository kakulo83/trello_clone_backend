# == Schema Information
#
# Table name: boards
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  account_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Board, type: :model do

  before(:context) do
    @account = Account.create!(name: "test_account", owner: @owner)
    @owner = User.create!(name: "Mr Owner", email: "owner@test.net", role: :owner, account_id: @account.id )
  end

  subject(:board) { Board.create(name: "todo", account: @account) }

  it { should belong_to(:account) }

  it { should have_many(:board_memberships) }

  it "has a name", board: true do
    expect(subject.name).to eq("todo")
  end

  it "has many admins", board: true do

  end
end
