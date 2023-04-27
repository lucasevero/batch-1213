class Employee
  attr_accessor :id
  attr_reader :password, :username, :role

  def initialize(attr = {})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
  end

  def manager?
    @role == "manager"
  end

  def rider?
    @role == "rider"
  end
end

# mathis = Employee.new(username: "mathis", password: "secret", role: 'manager')
# p mathis.manager?
# p mathis.rider?
# p mathis.password
