FactoryBot.define do
  factory :user do
    name { "Mr Owner" }
    email { "owner@test.net" }
    role { :user }
    password { "foobar" }
    password_confirmation { "foobar" }

    trait :owner do
      role { :owner }
    end
  end
end
