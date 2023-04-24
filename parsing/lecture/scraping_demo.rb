require "open-uri"
require "nokogiri"

ingredient = "chocolate"
url = "https://www.bbcgoodfood.com/search/recipes?q=#{ingredient}"

html_file = URI.open(url).read
html_doc = Nokogiri::HTML.parse(html_file)

html_doc.search(".card__section.card__content .link.d-block").each do |element|
  p element.attribute("href").value
end
