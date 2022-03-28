require 'faker'

puts 'Gerando clientes...'
User.create! email: 'user@user.com', name: 'user', password: "123", category: 'cliente'
User.create! email: 'admin@admin.com', name: 'admin', password: "123", category: 'transportadora'
98.times do |i|
  User.create! email: Faker::Internet.email, name: Faker::Name.name, password: "123", category: ["cliente","transportadora"].sample
end
puts 'Clientes gerados com sucesso!'

puts 'Gerando pacotes...'
100.times do |i|
  Package.create! content: Faker::Commerce.material, status: ["postado","em transito", "entregue"].sample, user_id: rand(1..100)
end
puts 'Pacotes gerados com sucesso!'