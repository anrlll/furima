require 'nkf'

FactoryBot.define do
  factory :user do
    japanese_user = Gimei.name
    @original_locale = Faker::Config.locale
    Faker::Config.locale = :ja
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    date_birth { Faker::Date.between(from: '2022-01-01', to: '2022-12-31') }
    last_name { japanese_user.last.kanji }
    last_name_kana { japanese_user.last.katakana }
    first_name { japanese_user.first.kanji }
    first_name_kana { japanese_user.first.katakana }
  end
end