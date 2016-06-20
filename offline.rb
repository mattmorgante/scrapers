require 'nokogiri'

file = File.open('AmsterdamAirbnb.htm')

html = Nokogiri::HTML(file)

puts html.css("body").text