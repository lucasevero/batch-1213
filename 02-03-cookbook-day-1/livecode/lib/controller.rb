require_relative "view"
require_relative "recipe"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # PSEUDOCODE
    # Gather all the recipes from the repo
    recipes = @cookbook.all
    # Send them to the VIEW and display them
    @view.display_list(recipes)
  end

  def add
    # PSEUDOCODE
    # Ask for a name for the recipe and save it
    name = @view.ask_for("the name of the recipe")
    # Ask for a description for the recipe and save it
    description = @view.ask_for("the description of the recipe")
    # Create a new recipe
    recipe = Recipe.new(name, description)
    # Send the recipe to the cookbook for storage
    @cookbook.create(recipe)
  end

  def remove
    # PSEUDOCODE
    # List all the recipes
    list
    # Ask for the index of the recipe they want to delete
    index = @view.ask_for("the index of the recipe you want to delete").to_i - 1
    # Send the index to the Cookbook to destroy a recipe
    @cookbook.destroy(index)
  end
end
