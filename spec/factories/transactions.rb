FactoryBot.define do
  factory :transaction do
    token {'tok_abcdefghijk00000000000000000'}
    postal_code { '123-4567'}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city {Faker::Address.city}
    block {Faker::Address.street_name}
    building {Faker::Address.building_number}
    telephone_number {Faker::Number.within(range: 1..99_999_999_999)}
  end
end
