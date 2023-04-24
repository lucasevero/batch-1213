def calculate(first_number, second_number, operator)
  case operator
  when "+"
    first_number + second_number
  when "-"
    first_number - second_number
  when "*"
    first_number * second_number
  when "/"
    first_number / second_number
  else
    nil
  end
end
