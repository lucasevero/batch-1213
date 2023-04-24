# ARRAYS
# CRUD - Create, Read, Update and Destroy
musicians = ['David Gilmour', 'Roger Waters', 'Richard Wright', 'Nick Mason']
# INDEXES      0                1                 2               3

# READ
p musicians[0] # => "David Gilmour"

# CREATE
# musicians.push("Eric Clapton")
musicians << "Eric Clapton"
p musicians # => ['David Gilmour', 'Roger Waters', 'Richard Wright', 'Nick Mason', 'Eric Clapton']

# UPDATE
musicians[4] = "Paul McCartney"
p musicians # => ['David Gilmour', 'Roger Waters', 'Richard Wright', 'Nick Mason', 'Paul McCartney']

# DESTROY
# musicians.delete("Paul McCartney")
musicians.delete_at(4)
p musicians # => ['David Gilmour', 'Roger Waters', 'Richard Wright', 'Nick Mason']

# RANGES
(1..3) # 1, 2 and 3
(1...3) # 1 and 2
(1...3).to_a # => [1, 2]
