require_relative 'calculator'

# PSEUDOCODE

# Check if the user's operator is valid, ask for the numbers again
# Ask the user if they want to continue calculating
calculate_again = ""

until calculate_again.upcase == "N"
  # Ask the user for the first number and store it
  puts 'Please enter a number:'
  print "> "
  num_1 = gets.chomp.to_i

  # Ask the user for the second number and store it
  puts 'Please enter another number:'
  print "> "
  num_2 = gets.chomp.to_i

  # Ask the user for the operator
  puts 'Please choose one of the operations [+, -, *, /]:'
  print "> "
  operator = gets.chomp

  # If the user inputs
    # +, sum the numbers
    # -, subtract the numbers
    # *, multiply the numbers
    # /, divide the numbers
  # Display the result

  # IF, ELSIF, ELSE
  # if operator == "+"
  # elsif operator == "-"
  # elsif operator == "*"
  # elsif operator == "/"
  # else
  # end

  puts calculate(num_1, num_2, operator)

  if ["+", "-", "*", "/"].include?(operator)
    puts "Do you want to calculate again? [Y/N]"
    calculate_again = gets.chomp
  else
    puts "Wrong input, please choose one of the operations [+, -, *, /]"
  end
end


# DEMO
# Please enter a number:
# > 2
# Please enter another number:
# > 2
# Please choose one of the operations [+, -, *, /]
# > +
# 4
# Do you want to calculate again? [Y, N]
# > N
