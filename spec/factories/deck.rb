FactoryBot.define do
  factory :deck do
    board
    title { "groceries" }
    position { 0 }

    factory :deck_with_cards do
      after :create do |deck|
        create_list :card, 3, deck: deck
      end
    end
  end
end
