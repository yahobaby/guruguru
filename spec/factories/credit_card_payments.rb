FactoryBot.define do
  factory :credit_card_payment do
    price {3000}
    token {"tok_abcdefghijk00000000000000000"}
    name  {"田中"}
    period {2023}
    
  end
end
