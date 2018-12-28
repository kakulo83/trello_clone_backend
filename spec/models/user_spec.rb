# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  email      :string
#  account_id :bigint(8)
#  extra      :jsonb            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:account) { Account.create!(name: "test_account") }

  describe "When the User is not an Owner or Admin" do
    subject(:user) { User.new(name: "Mr User", email: "user@test.net", account_id: account.id ) }

    it 'has a name' do
      expect(subject.name).to eq("Mr User")
    end

    it 'has an email' do
      expect(subject.email).to eq("user@test.net")
    end

    it 'is not an admin or owner', :aggregate_failures do
      expect(subject.admin?).to be_falsey
      expect(subject.owner?).to be_falsey
      expect(subject.user?).to be true
    end

    it { should belong_to(:account) }
  end

  describe "When the user is an Owner" do
    subject(:owner) { User.new(name: "Mr Owner", email: "owner@test.net", account_id: account.id, role: :owner) }

    it 'is an admin' do
      expect(subject.owner?).to be true
    end
  end
end
