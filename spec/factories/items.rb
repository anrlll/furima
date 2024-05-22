require "mini_magick"

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
    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/sample.jpg'), filename: 'sample.jpg', content_type: 'image/jpeg')
    end
    association :user_id
  end
end