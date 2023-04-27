require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def create(recipe)
    @recipes << recipe
    save_csv
  end

  def destroy(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path) do |row|
      # row => ["Cookies", "Cookies description"]
      row[2].to_f
      @recipes << Recipe.new(row[0], row[1], row[2], row[3])
    end
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      # csv << ["Cookies", "Cookis desc"]
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.rating, recipe.prep_time]
      end
    end
  end
end
