def encrypt(phrase)
  # PSEUDOCODE
  # Turn the phrase into an array of letters
  characters = phrase.upcase.split("")

  # Define an array for the alphabet
  alphabet = ("A".."Z").to_a

  # For each one of the characters,
  characters.map! do |char|
    # Check if it is a letter
    if alphabet.include?(char)
      # get the position of it in the alphabet
      index = alphabet.find_index(char)
      # substitute the letter by the one that is 3 position before in the alphabet
      # notice that negative indexes work, alphabet[-1] => "Z"
      char = alphabet[index - 3]
    end
    # Return the character
    char
  end
  # Join the array into an encrypted phrase
  characters.join
end
