require_relative "../views/session_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @view = SessionView.new
  end

  def login
    # PSEUDOCODE
    # Ask for the username
    username = @view.ask_for("username")
    # Ask for the password
    password = @view.ask_for("password")
    # Check if the credential are right:
    # Find an employee with that username
    employee = @employee_repository.find_by_username(username)
    # If the employee is found, check if the password is the same the one given
    if employee && employee.password == password
      @view.welcome(employee)
      employee
    else
      @view.wrong_credentials
      login
    end
  end
end
