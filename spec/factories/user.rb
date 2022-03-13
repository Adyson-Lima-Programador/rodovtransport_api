
FactoryBot.define do
# factory :nome_model_minusculo do
  factory :user do
    # campos da factory baseado no model aqui
    email {Faker::Internet.email}
    name {Faker::Name.name}
    password {"123"}
    category {["cliente","transportadora"].sample}
  end
end