class Router
  def initialize(patients_controller, rooms_controller)
    @patients_controller = patients_controller
    @rooms_controller = rooms_controller
    @running = false
  end

  def run
    @running = true
    while @running do
      print_options
      action = gets.chomp.to_i
      perform_action(action)
    end
  end

  def print_options
    puts "What would you like to do:"
    puts "1. List all patients and rooms"
    puts "2. Add a new patient"
    puts "3. Check out a patient"
    puts "4. Change a patient's room"
    puts "5. Stop and exit the program"
  end

  def perform_action(action)
    case action
    when 1 then @rooms_controller.list
    when 2 then @patients_controller.add
    when 3 then @patients_controller.check_out
    when 4 then @rooms_controller.move_patient
    when 5 then @running = false
    else
      puts "Invalid input. Try again!"
    end
  end
end
