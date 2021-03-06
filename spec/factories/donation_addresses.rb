FactoryBot.define do
  factory :donation_address do
    post_number { '123-1234' }
    area_id { 2 }
    city { '渋谷区' }
    address { '青山1-1-1' }
    building_name { '柳ビル' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
