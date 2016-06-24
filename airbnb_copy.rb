require 'open-uri'
require 'nokogiri'

url = "https://www.airbnb.com/s/Amsterdam"

page = Nokogiri::HTML(open(url))

#finds all div tags with both h5 and listing-name

# page.css('h5.listing-name').each do |line| 
#   puts line.text 
# end 

page.css('span.price-amount').each do |price| 
  puts price.text 
end 