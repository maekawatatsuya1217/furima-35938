FactoryBot.define do
  factory :user do
    email                 { Faker::Internet.free_email }
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation { password }
    nickname              { '前川達也' }
    family_name           { '前川' }
    first_name            { '達也' }
    family_name_kana      { 'マエカワ' }
    first_name_kana       { 'タツヤ' }
    birthday              { '2002-12-17' }
  end
end
