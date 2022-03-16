FactoryBot.define do
  factory :package do
    content { Faker::Commerce.material }
    status { ["postado","em transito", "entregue"].sample }
    user_id {rand(1..10)}
    user #{ nil }
  end
end
