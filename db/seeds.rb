require 'faker'

puts 'Gerando clientes...'
10.times do |i|
  User.create! email: Faker::Internet.email, name: Faker::Name.name, password: "123", category: ["cliente","transportadora"].sample
end
puts 'Clientes gerados com sucesso!'

puts 'Gerando pacotes...'
10.times do |i|
  Package.create! content: Faker::Commerce.material, status: ["postado","em transito", "entregue"].sample, user_id: rand(1..10)
end
puts 'Pacotes gerados com sucesso!'