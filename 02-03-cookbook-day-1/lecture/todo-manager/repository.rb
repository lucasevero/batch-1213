# THE REPO
# A collection of instances of the model - a list of tasks
# It's reponsable for the memory of our app
# It is connected to an external csv file which make any changes PERSISTENT
# It will later be replaced with a proper database

require 'csv'

class Repository
  def initialize(csv_file_path)
    @tasks = []
    @csv_file_path = csv_file_path
    load_csv
  end

  def add(task)
    @tasks << task
    save_csv
  end

  def all
    @tasks
  end

  def update(index, task)
    @tasks[index] = task
    save_csv
  end

  def destroy(index)
    @tasks.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      row[:completed] = row[:completed] == "true"
      @tasks << Task.new(row)
    end
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["content", "completed"]
      @tasks.each do |task|
        csv << [task.content, task.done?]
      end
    end
  end
end
