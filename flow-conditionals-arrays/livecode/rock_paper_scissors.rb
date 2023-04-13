# Create a Rock, Paper and Scissors game to play against the computer
# Whoever gets to 3 points, win

# PSEUDOCODE
# Define some important variables we are going to need:
# The options that you can choose and the score for the players
options = ["Rock", "Paper", "Scissors"]
computer_score = 0
user_score = 0

# Create a system that will continue to run until someone wins
until computer_score >= 3 || user_score >= 3
  # Display a message asking for either rock paper or scissors and get the user's input
  puts "Rock, paper or scissors?"
  user_input = gets.chomp
  # Check if the input is valid and make them try again if it's not
  until options.include?(user_input)
    puts "Wrong input, try again..."
    puts "Rock, paper or scissors?"
    user_input = gets.chomp
  end
  # Get a random input for the computer
  computer_input = options.sample

  # Display the choices
  puts "You: #{user_input}; Computer: #{computer_input}"

  # Calculate and display who won the round
  case user_input
  when computer_input
    puts "That's a tie!"
  when "Rock"
    if computer_input == "Paper"
      puts "Computer WINS"
      computer_score += 1
    else
      puts "You WIN"
      user_score += 1
    end
  when "Paper"
    if computer_input == "Scissors"
      puts "Computer WINS"
      computer_score += 1
    else
      puts "You WIN"
      user_score += 1
    end
  when "Scissors"
    if computer_input == "Rock"
      puts "Computer WINS"
      computer_score += 1
    else
      puts "You WIN"
      user_score += 1
    end
  end

  puts "------------"
  puts "SCORE:"
  puts "Computer: #{computer_score}"
  puts "You: #{user_score}"
  puts "------------"
end

# After we have a winner, tell the user the results
if user_score >= 3
  puts "Congratulations! You Won!"
else
  puts "Too bad... You lose"
end
