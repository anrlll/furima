FactoryBot.define do
  factory :userorder do
    postcode { "123-4567" }
    regiondelivery_id { 2 }
    municipalities {"横浜市"}
    blocknumber { "みなとみらい1-2-3" }
    buildingname { "浜のビル1-2-3" }
    telnumber { "08011112222" }
    token {"tok_abcdefghijk00000000000000000"}

    # association :purchase_id 定義不可
  end
end
