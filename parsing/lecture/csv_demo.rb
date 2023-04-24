require "csv"

# TODO - let's read/write data from beatles.csv
filepath = "data/beatles.csv"

# PARSING
# CSV.foreach(filepath, headers: :first_row) do |row|
#   puts "First Name: #{row["First Name"]}"
#   puts "Last Name: #{row["Last Name"]}"
#   puts "Instrument: #{row["Instrument"]}"
#   sleep 1
# end

# STORING
CSV.open("something.csv", "wb") do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  csv << ["John", "Lennon", "Guitar"]
  csv << ["Paul", "McCartney", "Bass Guitar"]
end
