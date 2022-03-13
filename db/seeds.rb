require 'faker'

puts 'Gerando clientes...'
10.times do |i|
  User.create! email: Faker::Internet.email, name: Faker::Name.name, password: "123", category: ["cliente","transportadora"].sample
end
puts 'Clientes gerados com sucesso!'
