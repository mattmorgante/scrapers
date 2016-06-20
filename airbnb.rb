require 'open-uri'
require 'nokogiri'

url = "https://www.airbnb.com/s/Amsterdam"

page = Nokogiri::HTML(open(url))

puts page