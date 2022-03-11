FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'12ab'+Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_kana             {'ヤマダ'}
    first_kana            {'タロウ'}
    birth                 {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end