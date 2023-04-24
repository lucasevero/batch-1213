# PSEUDOCODE
# Welcome
puts "--------------------"
puts "Welcome to our store"
puts "--------------------"

# Define the store
store = {
  "kiwi" => {
    price: 1.25,
    availability: 5
  },
  "banana" => {
    price: 0.5,
    availability: 4
  },
  "mango" => {
    price: 4,
    availability: 1
  },
  "aspargus" => {
    price: 9,
    availability: 5
  }
}

# Define a cart
cart = {}

# Print the available items along with their prices
puts "In our store today:"
store.each do |item, info|
  puts "#{item}: $#{info[:price]} (#{info[:availability]} available)"
end
puts "--------------------"

puts "Which item? (or 'quit' to checkout)"
item = gets.chomp
puts "How many?"
how_many = gets.chomp.to_i


sum = 0
until item == "quit"
  # Ask the user for an item

  # If the item is available, add it to the cart
  # else, tell them that we don't have this item
  if store.key?(item)
    available_items = store[item][:availability]
    if available_items >= how_many
      store[item][:availability] -= how_many
      if cart.key?(item)
        cart[item] += how_many
      else
        cart[item] = how_many
      end
    else
      puts "Sorry, there are only #{available_items} #{item}s left."
    end
  else
    puts "Sorry, we don't have #{item} today"
  end
  puts "Which item? (or 'quit' to checkout)"
  item = gets.chomp
  unless item == "quit"
    puts "How many?"
    how_many = gets.chomp.to_i
  end
end

# When the user quits, sum the prices of the items and display the result
puts "-------BILL---------"
cart.each do |item, quantity|
  each_price = store[item][:price]
  total_price = each_price * quantity
  sum += total_price
  puts "#{item}: #{quantity} X #{each_price} = #{total_price}"
end
puts "TOTAL: $#{sum}"
puts "--------------------"


# PSEUCODE
# Change the store so it manages to carry the availability of the items
# When the user adds an item
  # Check if there are enought item
  # Substract the bought item from the available
