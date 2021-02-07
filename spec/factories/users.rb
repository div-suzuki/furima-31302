FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.free_email}
    password              {'abcd0102'}
    password_confirmation {password}
    first_name            {'田中'}
    last_name             {'太郎'}
    first_name_kana       {'タナカ'}
    last_name_kana        {'タロウ'}
    birth_date            {'1930-01-01'}
  end
end