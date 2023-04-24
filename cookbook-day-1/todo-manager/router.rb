# THE ROUTER
# What keeps the app running
# It's the interface of the app
# It will be later replaced by the server/browser when we are creating websites!!!

class Router
  def initialize(controller)
    @running = false
    @controller = controller
  end

  def run
    @running = true

    while @running
      print_actions
      action = gets.chomp.to_i
      print `clear`
      perform_action(action)
    end
  end

  def perform_action(action)
    case action
    when 1 then @controller.list
    when 2 then @controller.add
    when 3 then @controller.mark
    when 4 then @controller.delete
    when 5
      @running = false
    end
  end

  def print_actions
    puts "-------------------------"
    puts "Which action?"
    puts "1 - List all tasks"
    puts "2 - Add a task"
    puts "3 - Mark a task as done"
    puts "4 - Delete a task"
    puts "5 - Quit"
    puts "-------------------------"
  end
end
