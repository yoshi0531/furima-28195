FactoryBot.define do
  factory :item do
    nickname              {Faker::Name.initials(number: 6)}
    email                 {Faker::Internet.free_email}
    password              {'1a'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday              {Faker::Date.between(from: '1930-01-01', to: '2015-12-31')}
    first_name            {"次郎"}
    last_name             {"フリマ"}
    first_name_reading    {"ジロウ"}
    last_name_reading     {"フリマ"}
  end
end
