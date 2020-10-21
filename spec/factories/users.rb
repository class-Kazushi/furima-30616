FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name           {"あア阿"}
    first_name            {"いイ井"}
    family_furigana       {"アアア"}
    first_furigana        {"イイイ"}
    birthday              {"1990-9-19"}
  end
end