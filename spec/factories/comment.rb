FactoryBot.define do
  factory :comment do
    user
    card
    text { Faker::Quotes::Shakespeare.hamlet_quote }
  end
end
