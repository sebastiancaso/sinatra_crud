require 'faker'
50.times do
  User.create(name: Faker::Name.name, address: Faker::Address.street_address, phone_number: Faker::PhoneNumber.phone_number, email: Faker::Internet.email, password: "password")
end
