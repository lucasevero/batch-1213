def acronymize(phrase)
  # PSEUDOCODE
  # 1. Transform the phrase into an array of words
  words = phrase.split

  # 2. Take the first letter of each word and append to a string
  acronym = ""
  words.each do |word|
    acronym = acronym + word[0]
  end

  # 3. Make sure to upcase the string at the end
  acronym.upcase
end

puts acronymize("") == ""
puts acronymize("AWAY FROM KEYBOARD") == "AFK"
puts acronymize("laughing my fucking ass off") == "LMFAO"
puts acronymize("fluminense FOOTBALL club") == "FFC"
