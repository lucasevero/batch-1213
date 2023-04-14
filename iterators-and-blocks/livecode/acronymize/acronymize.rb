# #each is forbidden!!!

def acronymize(phrase)
  # PSEUDOCODE
  # split the phrase into an array of words
  words = phrase.split

  # *change* each element into its first letter
  letters = words.map do |word|
    word[0].upcase
  end

  # join the array element into one string
  letters.join
end
