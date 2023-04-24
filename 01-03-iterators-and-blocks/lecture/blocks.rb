def timer
  start_time = Time.now
  puts "Performing before `yield`"
  yield
  puts "Performing after `yield`"
  puts "Elapsed time: #{Time.now - start_time}"
end

timer do
  # Perform a lot of code
  puts "just started to run the block"
  sleep 10
  puts "just finished to run the block"
end

# OUTPUT
# -------------------
# - Performing before `yield`
# - just started to run the block
# - just finished to run the block
# - Performing after `yield`
# - Elapsed time: 10.0014895762
# -------------------

def greet(first_name, last_name)
  capitalized_name = "#{first_name.capitalize} #{last_name.capitalize}"
  puts yield(capitalized_name)
end

greet("Luca", "Severo") do |name|
  "Hello, dear #{name}! How are you today?"
end
