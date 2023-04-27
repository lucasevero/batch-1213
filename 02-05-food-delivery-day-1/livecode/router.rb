# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = false
  end

  def run
    @running = true
    while @running
      print_options
      action = gets.chomp.to_i
      print `clear`
      perform_action(action)
    end
  end

  def print_options
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Quit the program"
  end

  def perform_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @running = false
    else
      puts "Wrong input. Try again!"
    end

  end
end
