require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

page1 = HTTParty.get('https://www.airbnb.com/s/losangeles')

parse_page1 = Nokogiri::HTML(page1)

# prints the names of each of the first 18 listings
# parse_page.css('.listing-name--display').each do |name|
#   puts name.text
# end 

prices_array = []

parse_page1.css('.price-amount').each do |price|
   listing_price = price.text
   prices_array.push(listing_price.to_i)
end

page2 = HTTParty.get('https://www.airbnb.com/s/losangeles?page=2')
parse_page2 = Nokogiri::HTML(page2)
parse_page2.css('.price-amount').each do |price| 
  listing_price = price.text
  prices_array.push(listing_price.to_i)
end 

page3 = HTTParty.get('https://www.airbnb.com/s/losangeles?page=3')
parse_page3 = Nokogiri::HTML(page3)
parse_page3.css('.price-amount').each do |price| 
  listing_price = price.text
  prices_array.push(listing_price.to_i)
end 

puts prices_array

CSV.open('airbnbla.csv', 'w') do |csv|
  csv << prices_array
end 





