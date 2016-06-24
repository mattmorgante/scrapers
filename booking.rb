require 'HTTParty'
require 'Nokogiri'
require 'JSON'
require 'csv'

page1 = HTTParty.get('http://www.booking.com/searchresults.html?dcid=4&label=opensearch-plugin&sid=3ab5d8e5dd695a1f5642d7aad698032b&sb=1&src=city&src_elem=sb&error_url=http%3A%2F%2Fwww.booking.com%2Fcity%2Fnl%2Famsterdam.html%3Flabel%3Dopensearch-plugin%3Bsid%3D3ab5d8e5dd695a1f5642d7aad698032b%3Bdcid%3D4%3Binac%3D0%26%3B&city=-2140479&checkin_monthday=19&checkin_year_month=2016-7&checkout_monthday=20&checkout_year_month=2016-7&room1=A%2CA&no_rooms=1&group_adults=2&group_children=0')
parse_page1 = Nokogiri::HTML(page1)
prices_array = []

parse_page1.css('div.sr-prc--num.sr-prc--final').each do |price|
   listing_price = price.text
   prices_array.push(listing_price.to_i)
end


prices_array.delete(0)
puts prices_array.compact