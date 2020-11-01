FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    detail { Faker::Lorem.sentence }
    category_id { Faker::Number.within(range: 1..10)}
    status_id {Faker::Number.within(range: 1..6)}
    cost_burden_id {Faker::Number.within(range: 1..2)}
    ship_from_id {Faker::Number.within(range: 1..47)}
    shipping_day_id {Faker::Number.within(range: 1..3)}
    price {Faker::Number.within(range: 300..9_999_999)}
    association :user
  end
end
