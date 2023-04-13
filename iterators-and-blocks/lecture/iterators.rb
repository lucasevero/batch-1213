musicians = ['David Gilmour', 'Roger Waters', 'Richard Wright', 'Nick Mason']

# for LOOP
# SYNTAX:

# for VARIABLE in COLLECTION
  # do stuff
# end

for musician in musicians
  p musician
  sleep 1
end

# EACH
# Run some code for every element
# Returns the original array
musicians.each do |musician|
  puts "Hey there, #{musician}!"
  sleep 1
end

# EACH WITH INDEX
musicians.each_with_index do |musician, index|
  puts "#{index + 1} - #{musician}"
  sleep 1
end

# MAP
# Transforms the elements
# Returns a changed array
upcased_musicians = musicians.map do |musician|
  musician.upcase
end
p upcased_musicians # => ["DAVID GILMOUR", "ROGER WATERS", "RICHARD WRIGHT", "NICK MASON"]

musicians_initials = musicians.map do |musician|
  musician.split[0][0] + musician.split[1][0]
end
p musicians_initials # => ["DG", "RW", "RW", "NM"]

# COUNT
# Count how many elements meet a given criteria
# Returns an integer
r_musicians_count = musicians.count do |musician|
  musician.start_with?("R")
end
p r_musicians_count # => 2


# SELECT
# Filters the array, leaving elements that meets a given criteria
r_musicians = musicians.select do |musician|
  musician.start_with?("R")
end
p r_musicians # => ["Roger Waters", "Richard Wright"]
