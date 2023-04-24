# RULES
# 1. You start with 100$
# 2. A bet costs 10$
# 3. When you win, you get 50$

# PSEUDOCODE
# Find a way to store the current balance of the user
balance = 100
continue_betting = ""

# When the user wins, incrise their balance
# When the user loses, decrese their balance
# Show the user's balance after the race and ask if they want to bet again (Make it LOOP)

until continue_betting.upcase == "N" || balance <= 0
  # 1. Welcome
  puts "Welcome to the Horse Race, here are the horces:"
  # 2. List the horses names
  horses = [
    "Alípio",
    "Horace Horsecollar",
    "BoJack",
    "Pegasus",
    "Secretariat",
    "Princess",
    "Angus",
    "Maximus"
  ]
  horses.each_with_index do |horse, index|
    puts "#{index + 1} - #{horse}"
  end

  # 3. Take the user input (which horse)
  puts "In which horse are you willing to bet on today? (enter the index)"
  horse_index = gets.chomp.to_i - 1
  balance -= 10
  chosen_horse = horses[horse_index]

  # 4. Take a random horse to win
  winner = horses.sample

  # 5. Compare if the user won
  puts "You choose: #{chosen_horse}; WINNER: #{winner}"
  # 6. Tell the user if they won
  if chosen_horse == winner
    puts "Congratulations. You won!"
    balance += 50
  else
    puts "I'm sorry... You lost"
  end
  puts "Your current balance is #{balance}. Do you want to play again? [Y, N]"
  continue_betting = gets.chomp
end

puts "Goodbye..."
