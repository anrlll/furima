FactoryBot.define do
  factory :item do
    name { "testitem" }
    price { 10000 }
    description {"testitem description"}
    category_id { 3 }
    condition_id { 2 }
    costdelivery_id { 2 }
    regiondelivery_id { 6 }
    datedelivery_id { 2 }
  end
end