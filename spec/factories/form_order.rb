FactoryBot.define do
  factory :form_order do
    zip_code             { '123-4567' }
    forwarding_origin_id { Faker::Number.between(from: 2, to: 48) }
    municipality         { '横浜市緑区' }
    address              { '青山1-1-1' }
    building_name        { Faker::String.random(length: 1..40) }
    phone_number         { Faker::Number.between(from: 00_000_000_000, to: 99_999_999_999) }
    token                { 'tok_abcdefghijk00000000000000000' }
  end
end
