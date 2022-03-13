
FactoryBot.define do
# factory :nome_model_minusculo do
  factory :user do
    # campos da factory baseado no model aqui
    name {Faker::Name.name}
    email {Faker::Internet.email}
    password {"123"}
    category {["cliente","transportadora"].sample}
  end
end