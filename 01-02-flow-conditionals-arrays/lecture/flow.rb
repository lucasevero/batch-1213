# IF
def if_can_i_vote?(age)
  if age >= 18
    return true
  end
  false
end

# IF, ELSE
def else_can_i_vote?(age)
  if age >= 18
    true
  else
    false
  end
end

p if_can_i_vote?(15) # => false
p if_can_i_vote?(21) # => true

# TERNARY
def flip_coin(choice)
  possible_results = ["heads", "tails"]
  flip = possible_results.sample

  flip == choice ? "Winner" : "Loser"
end

user_choice = gets.chomp
p flip_coin(user_choice) # => 'Winner' || 'Loser'


# ELSIF
def greet(hour)
  if hour < 12
    # ran if the previous line is truthy
    puts "Good morning!"
  elsif hour >= 20
    # ran if line 14 is falsy and line 27 is truthy
    puts "Good night!"
  elsif hour > 12
    # ran if lines 14 and 27 are falsy and line 30 is truthy
    puts "Good afternoon!"
  else
    puts "Lunch time!"
  end
end

# CASE
def choose_action(action)
  case action
  when "read" # if action == "read"
    puts "You are in READ mode"
  when "write"
    puts "You are in WRITE mode"
  when "exit"
    puts "Bye Bye"
  else
    puts "Wrong action"
  end
end
choose_action("read")
