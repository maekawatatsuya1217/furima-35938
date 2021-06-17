FactoryBot.define do
  factory :item do
    name {'オムライス'}
    description {'美味しいですよ！'}
    category_id {2}
    status_id {2}
    shipping_change_id {2}
    area_id {2}
    days_to_ship_id {2}
    price {1000}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
