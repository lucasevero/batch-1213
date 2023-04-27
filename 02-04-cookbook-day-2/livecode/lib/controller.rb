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
    rating = @view.ask_for("the rating of the recipe").to_f
    prep_time = @view.ask_for("the prep_time of the recipe")
    # Create a new recipe
    recipe = Recipe.new(name, description, rating, prep_time)
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

  def import
    # PSEUDOCODE
    # Ask for an ingredient, gets it and store
    ingredient = @view.ask_for("the ingredient you are looking for")
    # Go to a search page for the ingredient from allrecipes (https://www.allrecipes.com/search?q=INGREDIENT)
    url = "https://www.allrecipes.com/search?q=#{ingredient}"
    search_html_string = URI.open(url).open
    search_html_doc = Nokogiri::HTML.parse(search_html_string)

    # Find the urls for the RECIPES
      # filter the hrefs, I dont care about articles
    # Find the name of the recipes as well
    a_tags = search_html_doc.search("a.comp.mntl-card-list-items.mntl-document-card.mntl-card.card.card--no-image").select do |element|
      element["href"].include?("/recipe/")
    end.first(5)
    recipe_links = a_tags.map { |element| element["href"] }

    recipe_names = a_tags.map do |a_tag|
      a_tag.search(".card__title-text").first.text.strip
    end

    # Display the names for the user and ask for which one to add
    index = @view.ask_for_recipe_to_import(recipe_names)
    my_recipe_link = recipe_links[index]
    my_recipe_name = recipe_names[index]

    # Go to the recipe page
    recipe_html_string = URI.open(my_recipe_link).read
    recipe_html_doc = Nokogiri::HTML.parse(recipe_html_string)

    # Find the description of the recipe
    my_recipe_description = recipe_html_doc.search("#article-subheading_1-0").first.text.strip

    my_recipe_rating = recipe_html_doc.search("#mntl-recipe-review-bar__rating_1-0").first.text.strip.to_f

    my_recipe_prep_time = ""
    item = recipe_html_doc.search(".mntl-recipe-details__item").find do |item|
      item.search(".mntl-recipe-details__label").first.text.strip.include?("Total Time:")
    end
    my_recipe_prep_time = item.search(".mntl-recipe-details__value").first.text.strip

    # my_recipe_prep_time = ""
    # recipe_html_doc.search(".mntl-recipe-details__item").each do |item|
    #   if item.search(".mntl-recipe-details__label").first.text.strip == "Total Time:"
    #     my_recipe_prep_time = item.search("mntl-recipe-details__value").first.text.strip
    #   end
    # end

    # Create a recipe in the cookbook with the right information
    recipe = Recipe.new(my_recipe_name, my_recipe_description, my_recipe_rating, my_recipe_prep_time)
    @cookbook.create(recipe)
  end
end

# CSS_SELECTOR
# tag => h1, p, span
# class => .bold
# id => #logo

# search_html_doc.search("h1 .bold")
