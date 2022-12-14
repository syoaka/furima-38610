FactoryBot.define do
  factory :user do
    
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(mix_case: false,min_length: 6)}
    password_confirmation {password}
    nickname              {Faker::Name.initials(number: 2)}
    family_name           {Gimei.name.last.kanji}
    first_name            {Gimei.name.first.kanji}
    family_name_kana      {Gimei.name.last.katakana}
    first_name_kana       {Gimei.name.first.katakana}
    birth_date            {Faker::Date.between(from: '1930-01-01', to: '2017-12-31')}

  end
end