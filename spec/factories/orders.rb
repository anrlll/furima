FactoryBot.define do
  factory :order do
    postcode { "123-4567" }
    regiondelivery_id { 2 }
    municipalities {"横浜市"}
    blocknumber { "みなとみらい1-2-3" }
    buildingname { "浜のビル1-2-3" }
    telnumber { "08011112222" }
    association :purchase_id
  end
end
