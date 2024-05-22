FactoryBot.define do
  factory :purchase do
    association :item_id
    association :user_id
  end
end
