# == Schema Information
#
# Table name: owners
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  account_id :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Owner, type: :model do

  let(:account) { Account.create!(name: "test_account") }

  subject(:owner) { Owner.new(name: "Mr Owner", email: "owner@test.net", account_id: account.id ) }

  it 'has a name', owner: true do
    expect(subject.name).to eq("Mr Owner")
  end

  it 'has an email', owner: true do
    expect(subject.email).to eq("owner@test.net")
  end

  it { should belong_to(:account) }
end
