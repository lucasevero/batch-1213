require "open-uri"
require "nokogiri"

def fetch_movie_urls
  url = "https://www.imdb.com/chart/top"
  base_url = "https://www.imdb.com"

  html_string = URI.open(url).read
  html_doc = Nokogiri::HTML.parse(html_string)

  links = []
  html_doc.search(".titleColumn a").first(5).each do |link|
    links << base_url + link.attribute("href").value
  end
  links
end

def scrape_movie(url)
  html_string = URI.open(url, "User-Agent" => "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:89.0) Gecko/20100101 Firefox/89.0").read
  html_doc = Nokogiri::HTML.parse(html_string)

  title = html_doc.search("h1").first.text.strip
  year = html_doc.search(".ipc-link.ipc-link--baseAlt.ipc-link--inherit-color.sc-8c396aa2-1").text.to_i
  storyline = html_doc.search(".sc-16ede01-2").text
  director = html_doc.search('.ipc-metadata-list__item:contains("Director") a').first.text
  cast = html_doc.search('.ipc-metadata-list__item:contains("Stars") a.ipc-metadata-list-item__list-content-item').map { |element| element.text }.uniq

  {
    title: title,
    director: director,
    cast: cast,
    storyline: storyline,
    year: year
  }
end
