require_relative "scraper"
require "yaml"

top_urls = fetch_movie_urls
movies = top_urls.map do |url|
  scrape_movie(url)
end

yml_string = movies.to_yaml
File.open("movies.yml", "w") do |file|
  file.write(yml_string)
end
