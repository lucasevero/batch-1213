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
end
