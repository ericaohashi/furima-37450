FactoryBot.define do
  factory :item do
  item_name {Faker::Name.initials(number: 2)}
  price     {500}
  content   {'商品説明'}
  schedule_id {3}
  ship_fee_id  {3}
  category_id  {3}
  item_status_id {3}
  prefecture_id  {3}

  association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
