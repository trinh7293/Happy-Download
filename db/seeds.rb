# Users
puts "1. create admin"
User.create! name: "Example User",
  email: "admin@gmail.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true
puts "2. create user"
10.times do |n|
  name = Faker::Name.name
  email = "user-#{n+1}@gmail.org"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    created_at: Time.zone.now
end
puts "3. categories"
5.times do
  name = Faker::Name.name
  Category.create! name: name,
    created_at: Time.zone.now
end

puts "5. Product"
users = User.all
categories = Category.all
users[1..5].each do |user|
  categories[1..4].each do |category|
    5.times do
      price = Faker::Commerce.price
      title = Faker::Music.instrument
      Product.create! user_id: user.id,
        link_preview: "https://www.google.com",
        category_id: category.id,
        created_at: Time.zone.now,
        title: title,
        price: price
    end
  end
end
