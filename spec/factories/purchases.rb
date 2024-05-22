FactoryBot.define do
  factory :purchase do
    user_id {1}
    item_id {1}

    association :item
    association :user
    association :order
  end
end
