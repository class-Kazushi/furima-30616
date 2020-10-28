FactoryBot.define do
  factory :purchase_address do
    postal_code {"000-0000"}
    prefecture_id {Faker::Number.within(range: 1..47)}
    city {"あア阿市いイ井区"}
    address_num {"45-506"}
    building_name {"ハイツうウ宇106"}
    phone_num {"08022223333"}
  end
end
