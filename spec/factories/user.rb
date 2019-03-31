FactoryBot.define do
  factory :user, aliases: [:creator] do
    association :account
    name { Faker::Name.name }
    email { Faker::Internet.email }
    role { :user }
    password { "foobar" }
    password_confirmation { "foobar" }

    trait :owner do
      role { :owner }
    end

    trait :admin do
      role { :admin }
    end
  end
end
