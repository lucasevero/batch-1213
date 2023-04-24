require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# PARSING
serialized_json = File.read(filepath)

beatles = JSON.parse(serialized_json)

p beatles["title"]

# STORING
beatles = { beatles: [
  {
    first_name: "John",
    last_name: "Lennon",
    instrument: "Guitar"
  },
  {
    first_name: "Paul",
    last_name: "McCartney",
    instrument: "Bass Guitar"
  }
]}

File.open("something.json", "wb") do |file|
  file.write(JSON.generate(beatles))
end
