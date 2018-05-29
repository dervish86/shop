FactoryBot.define do
  factory :product do
    name { Faker::Name.unique.name }
    image { Faker::Internet.url }
    url { Faker::Internet.url }
    score { Faker::Number.decimal(1, 2) }
    price { Faker::Number.decimal(2, 2) }
  end
end
