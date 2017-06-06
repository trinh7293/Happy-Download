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
    recipient: "acct_1ARyxBD3nNOlHHVz",
    created_at: Time.zone.now
end
puts "3. categories"
cat = ["Link", "Image", "Theme", "Code", "Vector"]
cat.each do |cat|
  Category.create! name: cat,
    created_at: Time.zone.now
end

puts "4. Product"
users = User.all
categories = Category.all
users[1..5].each do |user|
  categories[0..4].each do |category|
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

puts "5. Orderdetail"
(3.weeks.ago.to_date..Date.today).each do |date|
  product_id = users[2].products[rand 15].id
  product_id2 = users[1].products[rand 15].id
  puts "same" if product_id == product_id2
  seller_id = users[2].id
  buyer_id = users[1].id
  price1 = Product.find_by(id: product_id).price
  price2 = Product.find_by(id: product_id2).price
  OrderDetail.create! product_id: product_id,
    seller_id: seller_id,
    buyer_id: buyer_id,
    created_at: date,
    price: price1

  OrderDetail.create! product_id: product_id2,
    seller_id: buyer_id,
    buyer_id: seller_id,
    created_at: date,
    price: price2
end
