class View
  def display_list(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name}"
    end
  end

  def ask_for(something)
    puts "Please enter #{something}:"
    gets.chomp
  end

  def ask_for_recipe_to_import(recipe_names)
    puts "Please enter the index of the recipe you want to add"
    recipe_names.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe}"
    end
    gets.chomp.to_i - 1
  end
end
