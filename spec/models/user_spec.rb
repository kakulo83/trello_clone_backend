# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  name            :string
#  email           :string
#  account_id      :integer
#  role            :integer          default("user")
#  integer         :integer          default(0)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

require 'rails_helper'

RSpec.describe User, type: :model do

  let(:account) { Account.create(name: "test_account") }

  context "all users" do
    subject(:user) { User.create(name: "Mr User",
                                 email: "user@test.net",
                                 account_id: account.id,
                                 password: "foobar",
                                 password_confirmation: "foobar") }

    it { should belong_to(:account) }
    it { should have_many(:boards) }
    it { should have_many(:comments) }

    it "name should be present" do
      expect(subject.name).to eq("Mr User")
    end

    it "email should be present" do
      expect(subject.email).to eq("user@test.net")
    end

    it "has names that are not too short" do
      user.name = "feeder" * 10
      expect(user).not_to be_valid
    end

    it "has emails that are not too long" do
      user.email = "feeder" * 100  + "@test.net"
      expect(user).not_to be_valid
    end

    it "rejects invalid email addresses" do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end

    it "has a unique email address" do
      duplicate_user = user.dup
      user.save
      expect(duplicate_user).not_to be_valid
    end

    it "has a nonblank password" do
      user.password = user.password_confirmation = " " * 6
      expect(user).not_to be_valid
    end

    it "has a password with a minimum length" do
      user.password = user.password_confirmation = "a" * 5
      expect(user).not_to be_valid
    end
  end

  describe "when the User is not an Owner or Admin" do
    subject(:user) { create(:user) }
    # subject(:user) { create(:user, role: :owner) }
    # subject(:user) { User.create(name: "Mr User", email: "user@test.net", account_id: account.id ) }

    it "is not an admin or owner", :aggregate_failures do
      expect(subject.admin?).to be_falsey
      expect(subject.owner?).to be_falsey
      expect(subject.user?).to be true
    end
  end

  describe "when the user is an Owner" do
    subject(:owner) { User.create(name: "Mr Owner", email: "owner@test.net", account_id: account.id, role: :owner) }

    it "is an owner" do
      expect(subject.owner?).to be true
    end
  end

  describe "when the user is an Admin" do
    pending "add some specs"
  end
end
