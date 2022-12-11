FactoryBot.define do
  factory :info do
    text                  { Faker::Lorem.sentence }
    title                 { Faker::Name.initials }
    association :user
  end
end
