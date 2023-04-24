require "nokogiri"
require "open-uri"

item = "dress"
url = "https://www.etsy.com/search?q=#{item}&ref=search_bar"

html_string = URI.open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read

html_doc = Nokogiri::HTML.parse(html_string)

p html_doc.search(".v2-listing-card__info .wt-text-caption.v2-listing-card__title").first(5).each_with_index do |element, index|
  # puts "#{index + 1} - #{element.text.strip}"
end
