class CustomerView
  def ask_for(something)
    puts "Please, enter #{something}"
    gets.chomp
  end

  def display_customers(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1} - #{customer.name}: #{customer.address}"
    end
    puts "=================="
  end
end
