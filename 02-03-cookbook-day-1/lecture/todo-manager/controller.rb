# THE CONTROLLER
# The middle fielder of the team, the boss
# It haves different sets of instructions (stored as methods) for each action the user wants to perform
# It sends and receives information from:
  # THE REPO
  # THE VIEW
  # THE MODEL

require_relative "task"
require_relative "view"

class Controller
  def initialize(repository)
    @repository = repository
    @view = View.new
  end

  def list
    # Get the tasks from the repo
    tasks = @repository.all
    # Send the tasks to the view and display them
    @view.display_tasks(tasks)
  end

  def add
    # Gets a task nam from the user
    task_name = @view.ask_for_recipe
    # Create an instance of task
    task = Task.new(content: task_name)
    # Send the task to the repo and store it
    @repository.add(task)
  end

  def mark
    # Get the tasks from the repo
    tasks = @repository.all
    # Send the tasks to the view and display them
    @view.display_tasks(tasks)
    # Ask for the index of the task to be marked
    index = @view.ask_for_index_to_mark
    # Find the task
    task = tasks[index]
    # Mark it as done
    task.mark_as_done!
    # Update it in the repo
    @repository.update(index, task)
  end

  def delete
    # Grab all the tasks in the repo
    tasks = @repository.all
    # Display them to the user
    @view.display_tasks(tasks)
    # Ask the user for the index of the task they waant to delete
    index = @view.ask_for_index_to_destroy
    # Ask the repo to delete the task in the right index
    @repository.destroy(index)
  end
end
