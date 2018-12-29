# == Schema Information
#
# Table name: accounts
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  owner_id   :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Account, type: :model do
  let(:account_name) { "test_account" }
  subject(:account) { Account.create!(name: account_name) }

  it 'has a name', account: true do
    expect(subject.name).to eq("test_account")
  end

  it { should have_many(:users) }
  it { should have_one(:owner) }
  it { should have_many(:admins) }
  it { should have_many(:boards) }
end
