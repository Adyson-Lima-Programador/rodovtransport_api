require 'faker'

puts 'Gerando clientes... <categoria 1 = transportadora/admin, categoria 2 = user >'
User.create! email: 'admin@admin.com', name: 'admin', password: "123", category: '1'
User.create! email: 'user@user.com', name: 'user', password: "123", category: '2'
98.times do |i|
  User.create! email: Faker::Internet.email, name: Faker::Name.name, password: "123", category: ["1","2"].sample
end
puts 'Clientes gerados com sucesso!'

puts 'Gerando pacotes...'
100.times do |i|
  Package.create! content: Faker::Commerce.material, status: ["postado","em transito", "entregue"].sample, user_id: rand(1..100)
end
puts 'Pacotes gerados com sucesso!'