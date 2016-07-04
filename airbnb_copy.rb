require 'open-uri'
require 'nokogiri'

url = "https://www.airbnb.com/s/Amsterdam"

page = Nokogiri::HTML(open(url))

page.css('span.price-amount').each do |price| 
  puts price.text 
end 

