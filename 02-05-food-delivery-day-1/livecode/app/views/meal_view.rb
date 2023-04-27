class MealView
  def ask_for(something)
    puts "Please, enter #{something}"
    gets.chomp
  end

  def display_meals(meals)
    meals.each_with_index do |meal, index|
      puts "#{index + 1} - #{meal.name}: #{meal.price}"
    end
    puts "=================="
  end
end
