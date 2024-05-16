require 'nkf'

FactoryBot.define do
  factory :user do
    @original_locale = Faker::Config.locale
    Faker::Config.locale = :ja
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    date_birth { Faker::Date.between(from: '2022-01-01', to: '2022-12-31') }
    last_name { Faker::Name.last_name }
    last_name_kana { NKF.nkf('-w -Z1', last_name) }
    first_name { Faker::Name.first_name }
    first_name_kana { NKF.nkf('-w -Z1', first_name) }
  end
end