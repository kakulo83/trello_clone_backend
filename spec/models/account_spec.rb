require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account_name) { "test_account" }
  let(:account) { Account.create!(name: account_name) }

  it "has a name" do
    account = Account.create!(name: account_name)
    expect(account.name).to eq("test_account")
  end
end
