require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

page = HTTParty.get('https://www.tripadvisor.com/Attractions-g312848-Activities-San_Carlos_de_Bariloche_Province_of_Rio_Negro_Patagonia.html')
parse_page = Nokogiri::HTML(page)
alt_tags = []
names_array = []

alt_tags = parse_page.css('img.sprite-ratings').map{ |i| i['alt'] }
parse_page.css('div.property_title').each do |name|
  names_array.push(name.text)
end

my_hash = {}
my_hash = Hash[names_array.zip(alt_tags)] 
puts my_hash

# hash = {"\nReserva Nacional Cerro Castillo\n"=>"5 of 5 stars", "\nCoyhaique National Reserve\n"=>"4.5 of 5 stars"} etc etc 

# 
