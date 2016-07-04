require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

page1 = HTTParty.get('http://www.hostelworld.com/hostels/Rio-de-Janeiro')
parse_page1 = Nokogiri::HTML(page1)
prices_array = []

parse_page1.css('span.price').each do |price|
  price = price.text.delete('€, ')  
  prices_array.push(price.to_i)
end


page2 = HTTParty.get('http://www.hostelworld.com/hostels/Rio-de-Janeiro?page=2')
parse_page2 = Nokogiri::HTML(page2)
parse_page2.css('span.price').each do |price| 
  price = price.text.delete('€, ')  
  prices_array.push(price.to_i)
end 

page3 = HTTParty.get('http://www.hostelworld.com/hostels/Rio-de-Janeiro?page=3')
parse_page3 = Nokogiri::HTML(page3)
parse_page3.css('span.price').each do |price| 
  price = price.text.delete('€, ')  
  prices_array.push(price.to_i)
end 

prices_array.delete(0)
prices_array = prices_array.select.with_index { |_, i| i.odd? }
puts prices_array

CSV.open('rio.csv', 'w') do |csv|
  csv << prices_array
end 
