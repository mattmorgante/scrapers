require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

page = HTTParty.get('https://www.tripadvisor.com/Attractions-g316035-Activities-El_Chalten_Province_of_Santa_Cruz_Patagonia.html')
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

