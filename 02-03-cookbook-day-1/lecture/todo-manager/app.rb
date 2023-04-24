# This file exists to intantiate all the object we will need and run the app
# The user will run `ruby app.rb`

require_relative "repository"
require_relative "controller"
require_relative "router"

csv_file_path = File.join(__dir__, "tasks.csv")
repository = Repository.new(csv_file_path)
controller = Controller.new(repository)
router = Router.new(controller)

router.run # run the app!
