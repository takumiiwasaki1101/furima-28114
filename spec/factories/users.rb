FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    family_name { Gimei.last.kanji }
    first_name { Gimei.first.kanji }
    family_name_furigana { Gimei.last.katakana }
    first_name_furigana { Gimei.first.katakana }
    date_of_birth { Faker::Date.in_date_period }
  end
end
