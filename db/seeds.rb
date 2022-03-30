require 'faker'

puts 'Gerando usuários... <categoria 1 = transportadora/admin, categoria 2 = user >'
User.create! email: 'admin@admin.com', name: 'admin', password: "123", category: '1'
User.create! email: 'user@user.com', name: 'user', password: "123", category: '2'
28.times do |i|
  User.create! email: Faker::Name.first_name+"@rodovtransport.com", name: Faker::Name.name, password: "123", category: ["1","2"].sample
end
puts 'Usuários gerados com sucesso!'

puts 'Gerando pacotes...'
100.times do |i|
  Package.create! content: Faker::Commerce.material, status: ["postado","em transito", "entregue"].sample, user_id: rand(3..30)
end
puts 'Pacotes gerados com sucesso!'