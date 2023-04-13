# CRUD - CREATE, READ, UPDATE, DESTROY

beatles = ["john", "ringo", "seb"]

# READ
# array[index]
beatles[2] # => "seb"

# UPDATE
beatles[2] = "george"

# CREATE
beatles << "paul"

# DESTROY
beatles.delete("john")
beatles.delete_at(0)

# EACH
beatles.each do |beatle|
  puts "#{beatle} is in the band!"
  sleep 1
end
