require_relative "../views/meal_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealView.new
  end

  def add
    name = @view.ask_for("the name of the meal")
    price = @view.ask_for("the price of the meal").to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  def list
    meals = @meal_repository.all
    @view.display_meals(meals)
  end
end
