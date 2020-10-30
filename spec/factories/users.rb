FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.last_name }
    email                 { Faker::Internet.free_email }
    password              = '1qa1qa'
    password              { password }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '一郎' }
    last_name_kana        { 'ヤマダ' }
    first_name_kana       { 'イチロウ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2020-01-01') }
  end
end
