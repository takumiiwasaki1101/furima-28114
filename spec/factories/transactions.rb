FactoryBot.define do
  factory :transaction do
    postal_code { '123-4567'}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city {Faker::Address.city}
    block {Faker::Address.street_name}
    building {Faker::Address.building_number}
    telephone_number {Faker::Number.within(range: 1..99999999999)}
  end
end
