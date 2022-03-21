FactoryBot.define do
  factory :PurchasesShipping do
    post { '123-4567' }
    prefecture_id { 3 }
    city { '葛飾区' }
    address { '1-1-1' }
    building { 'leo' }
    phone { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
