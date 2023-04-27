# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = false
  end

  def run
    @running = true
    while @running
      @employee = @sessions_controller.login unless @employee
      @employee.manager? ? route_for_managers : route_for_riders
    end
  end

  def route_for_managers
    print_manager_options
    action = gets.chomp.to_i
    print `clear`
    perform_manager_action(action)
  end

  def route_for_riders
    print_rider_options
    action = gets.chomp.to_i
    print `clear`
    perform_rider_action(action)
  end

  def print_manager_options
    puts "1 - Add a meal"
    puts "2 - List all meals"
    puts "3 - Add a customer"
    puts "4 - List all customers"
    puts "5 - Logout"
    puts "6 - Quit the program"
  end

  def print_rider_options
    puts "1 - List all my undelivered orders"
    puts "2 - Mark an order as delivered"
    puts "3 - Logout"
    puts "4 - Quit the program"
  end

  def perform_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 5 then @employee = nil
    when 6 then @running = false
    else
      puts "Wrong input. Try again!"
    end
  end

  def perform_rider_action(action)
    case action
    when 1 then puts "#TODO"
    when 2 then puts "#TODO"
    when 3 then @employee = nil
    when 4 then @running = false
    else
      puts "Wrong input. Try again!"
    end
  end
end
