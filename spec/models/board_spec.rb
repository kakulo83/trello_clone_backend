# == Schema Information
#
# Table name: boards
#
#  id         :bigint(8)        not null, primary key
#  title      :string
#  account_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Board, type: :model do

  let(:account) { Account.create(name: "test_account", owner: owner) }
  let(:owner)   { create(:user, :owner) }

  subject(:board) { Board.create(title: "todo", account: @account) }

  it { should belong_to(:account) }

  it { should have_many(:board_memberships) }

  it { should have_many(:decks) }

  it { should have_many(:cards) }

  it "has a title", board: true do
    expect(subject.title).to eq("todo")
  end
end
