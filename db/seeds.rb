# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
require "json"
require "open-uri"
puts "seed destruction"
Movie.destroy_all

url = "http://tmdb.lewagon.com/movie/top_rated"
data_serialized = URI.open(url).read
data = JSON.parse(data_serialized)
# p data["results"].first
data["results"].sample(10).each do |movie|
  Movie.create!(title: movie["title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}", rating: movie["vote_average"])
  # puts "#{movie["title"]} - #{movie["overview"]} - #{movie["poster_path"]} - #{movie["vate_average"]}"
end
# puts "#{movie["title"]} - #{movie["overview"]} - #{movie["poster_path"]} - #{movie["vate_average"]}}"
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
