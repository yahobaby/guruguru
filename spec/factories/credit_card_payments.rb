FactoryBot.define do
  factory :credit_card_payment do
    price { 3000 }
    token { 'tok_abcdefghijk00000000000000000' }
    name  { Faker::Name.initials }
    period { 1234 }
    association :user
  end
end
