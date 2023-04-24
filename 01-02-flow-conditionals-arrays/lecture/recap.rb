# DATA TYPES
"FLUMINENSE".class # => String
42.class # => Integer
42.0.class # => Float
true.class # => TrueClass
false.class # => FalseClass
(0..42).class # => Range
["Ganso", "Arias", "Cano"].class # => Array

# VARIABLES
# A 'box' with a name that takes a Ruby object
name = "Alena"

# METHODS
# PARAMETERS - the name of the variables create in the definition of a method 👇 first_name && last_name
def capitalized_name(first_name, last_name)
  "#{first_name.capitalize} #{last_name.capitalize}"
end

# ARGUMENTS - the objects passed in a method call 👇 "Jamie" && "Heo"
puts capitalized_name("Jamie", "Heo")
