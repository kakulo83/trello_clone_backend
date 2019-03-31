FactoryBot.define do
  factory :account do
    name { "test_account" }

    factory :account_with_boards do
      after :create do |account|
        create_list :board, 5, account: account
      end
    end
  end
end
