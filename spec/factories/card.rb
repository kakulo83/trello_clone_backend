FactoryBot.define do
  factory :card do
    title { "Buy some groceries" }
    description { "The house todo list for groceries" }
    deck
    creator
    position { 0 }
  end
end
