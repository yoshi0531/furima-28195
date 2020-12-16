FactoryBot.define do
  factory :buyer do
    postal_code   {Faker::PhoneNumber.subscriber_number(length: 3)+'-'+Faker::Number.decimal_part(digits: 4)}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city          {"横浜市緑区"}
    house_number  {"青山1-1-1"}
    building_name {"柳ビル103"}
    phone_number  {Faker::Number.leading_zero_number(digits: 11)}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end