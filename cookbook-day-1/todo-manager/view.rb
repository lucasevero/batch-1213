# THE VIEW
# Responsable for talking with the user
# i.e. puts && gets.chomp
# Everytime you need to talk to the user, create a new method in here 👇

class View
  def ask_for_recipe
    puts "Which task do you want to add?"
    gets.chomp
  end

  def display_tasks(tasks)
    tasks.each_with_index do |task, index|
      x_or_space = task.done? ? "X" : " "
      puts "[#{x_or_space}] #{index + 1} - #{task.content}"
    end
  end

  def ask_for_index_to_mark
    puts "Please choose the task you want to mark as done: (enter the index)"
    gets.chomp.to_i - 1
  end

  def ask_for_index_to_destroy
    puts "Please choose the task you want to destroy: (enter the index)"
    gets.chomp.to_i - 1
  end
end
