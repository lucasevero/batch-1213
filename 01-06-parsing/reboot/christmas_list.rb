require "nokogiri"
require "open-uri"

# PSEUDOCODE
# Create the list
# Change the gift_list so it handles if the gift was bought
gift_list = [
  {
    name: "Macbook",
    status: true
  }
]

# Welcome the user to the List
puts "Welcome to your Christmas gift list"
# Ask for an action [list, add, detele, quit]
puts "Which action [list|add|mark|idea|delete|quit]?"
action = gets.chomp

# Perform the action (printing a TODO)
# Ask again until they input 'quit'
until action == "quit"
  case action
  when "list"
    gift_list.each_with_index do |gift, index|
      x_or_space = gift[:status] ? "X" : " "
      puts "[#{x_or_space}] #{index + 1} - #{gift[:name]}"
    end
  when "add"
    puts "Please enter the name of the gift:"
    gift = gets.chomp
    gift_list << { name: gift, status: false }
  when "mark"
    # List the gifts
    gift_list.each_with_index do |gift, index|
      x_or_space = gift[:status] ? "X" : " "
      puts "[#{x_or_space}] #{index + 1} - #{gift[:name]}"
    end

    # Ask for an index
    puts "Please enter the index of the item you want to mark:"
    index = gets.chomp.to_i - 1
    # Update the chosen gift
    gift_list[index][:status] = true

  when "idea"
    puts "What are you looking for on Etsy?"
    item = gets.chomp
    puts "Here are Etsy results for '#{item}':"

    url = "https://www.etsy.com/search?q=#{item}&ref=search_bar"
    html_string = URI.open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
    html_doc = Nokogiri::HTML.parse(html_string)

    ideas = []
    html_doc.search(".v2-listing-card__info .wt-text-caption.v2-listing-card__title").first(5).each_with_index do |element, index|
      puts "#{index + 1} - #{element.text.strip}"
      ideas << element.text.strip
    end

    puts "Pick one to add to your list (give the number)"
    index = gets.chomp.to_i - 1

    idea = ideas[index]
    gift_list << { name: idea, status: false}
  when "delete"
    puts "TODO: ask user the index of item to delete and delete it"
    gift_list.each_with_index do |gift, index|
      x_or_space = gift[:status] ? "X" : " "
      puts "[#{x_or_space}] #{index + 1} - #{gift[:name]}"
    end
    puts "Please enter the index of the item you want to delete:"
    index = gets.chomp.to_i - 1
    gift_list.delete_at(index)
  else
    puts "Wrong input..."
  end

  puts "Which action [list|add|mark|idea|delete|quit]?"
  action = gets.chomp
end

# Say goodbye
puts "Goodbye!"
