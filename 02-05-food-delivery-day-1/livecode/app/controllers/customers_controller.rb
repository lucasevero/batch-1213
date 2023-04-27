require_relative "../views/customer_view"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add
    name = @view.ask_for("the name of the customer")
    address = @view.ask_for("the address of the customer")
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  def list
    customers = @customer_repository.all
    @view.display_customers(customers)
  end
end
