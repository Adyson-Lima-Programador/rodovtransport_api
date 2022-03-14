FactoryBot.define do
  factory :package do
    content { Faker::Commerce.material }
    status { ["postado","em transito", "entregue"].sample }
  end
end
