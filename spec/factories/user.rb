FactoryBot.define do
  factory :user do
    account
    name { "Mr Owner" }
    email { "owner@test.net" }
    role { :user }
    password { "foobar" }
    password_confirmation { "foobar" }

    association

    trait :owner do
      role { :owner }
    end
  end
end
