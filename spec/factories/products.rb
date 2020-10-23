FactoryBot.define do
  factory :product do
    name {Faker::Name.name}
    details {Faker::Lorem.sentence}
    category_id {Faker::Number.within(range: 2..10)}
    condition_id {Faker::Number.within(range: 2..7)}
    delivery_charge_id {Faker::Number.within(range: 2..3)}
    region_id {Faker::Number.within(range: 1..47)}
    period_id {Faker::Number.within(range: 2..4)}
    price {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
