FactoryBot.define do
  factory :item do
    name {"sample"}
    description {"sample"}
    category_id {2}
    shipping_cost_id {2}
    prefecture_id {2}
    shipping_days_id {2}
    status_id {2}
    price {2222}
    image {Faker::Lorem.sentence}

    association :user

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
