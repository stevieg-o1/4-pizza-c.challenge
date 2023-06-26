
puts "started seeding..."

5.times do
    name = Faker::Restaurant.name
    address =  Faker::Address.street_address
    Restaurant.create(name:name, address:address)
end

5.times do
    name = Faker::Food.dish
    ingredients = Faker::Food.ingredient
    Pizza.create(name:name, ingredients:ingredients)
end

5.times do
    price = Faker::Commerce.price(range: 1..30)
    pizza_id = rand(1..5)
    restaurant_id = rand(1..5)
    RestaurantPizza.create(price:price, pizza_id:pizza_id, restaurant_id:restaurant_id)
end

puts "Completed seeding."