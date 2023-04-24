counter = 0
# LOOP && BREAK
loop do
  counter = counter + 1
  puts counter
  break if counter >= 10
end

# WHILE
while counter < 10
  counter = counter + 1
  puts counter
end


# UNTIL
number = rand(1..5)
choice = nil

until choice == number
  puts "Guess the number?"
  choice = gets.chomp.to_i
end

puts "You got it!"

# FOR
for fruit in ["apple", "lemon", "pears"]
  puts "the current fruit is #{fruit}"
  sleep 1
end
