FactoryBot.define do
  factory :order_address do
    post_code      { '123-4567' }
    prefecture_id  { '2' }
    city           { '東京都' }
    address1       { '1-1' }
    address2       { '東京ハイツ' }
    telephone      { '11111111111' }
    
  end
end
