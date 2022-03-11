require 'faker'

puts 'Gerando clientes...'
10.times do |i|
  User.create! name: Faker::Name.name, email: Faker::Internet.email, password: "123", category: ["cliente","transportadora"].sample
end
puts 'Clientes gerados com sucesso!'
