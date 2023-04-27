require_relative "app/repositories/meal_repository"
require_relative "app/repositories/customer_repository"

require_relative "app/controllers/meals_controller"
require_relative "app/controllers/customers_controller"

require_relative "router"

# CSV FILES
# CSV FILES
meal_csv = File.join(__dir__, "data/meals.csv")
customer_csv = File.join(__dir__, "data/customers.csv")

# REPOS
meal_repository = MealRepository.new(meal_csv)
customer_repository = CustomerRepository.new(customer_csv)

# CONTROLLERS
meals_controller = MealsController.new(meal_repository)
customers_controller = CustomersController.new(customer_repository)

# ROUTER
router = Router.new(meals_controller, customers_controller)

router.run
