# == Schema Information
#
# Table name: decks
#
#  id         :bigint(8)        not null, primary key
#  board_id   :bigint(8)
#  title      :string
#  position   :integer
#  archived   :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Deck, type: :model do
  let(:account) { Account.create(name: "test_account", owner: owner) }
  let(:owner)   { User.create(name: "Mr Owner",
                          email: "owner@test.net",
                          role: :owner,
                          account_id: @account.id,
                          password: "foobar",
                          password_confirmation: "foobar") }

  subject(:deck) { Deck.create(title: "todo",


  it { should belong_to(:board) }
  it { should have_many(:cards) }

  it "title should be present" do

  end
end
