FactoryBot.define do
  factory :item do
    name                           { Faker::String.random(length: 1..40) }
    description                    { Faker::Lorem.sentence }
    category_id                    { Faker::Number.between(from: 2, to: 11) }
    condition_id                   { Faker::Number.between(from: 2, to: 7) }
    charge_of_distribution_cost_id { Faker::Number.between(from: 2, to: 3) }
    forwarding_origin_id           { Faker::Number.between(from: 2, to: 48) }
    before_forward_date_id         { Faker::Number.between(from: 2, to: 4) }
    price                          { Faker::Number.between(from: 300, to: 9_999_999) }

    # itemから見てuserはbelongs_toの関係のため、userモデルとのアソシエーション定義
    association :user

    # 画像に関する設定
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.JPG'), filename: 'test_image.JPG')
    end
  end
end
