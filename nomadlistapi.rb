require 'open-uri'
require 'nokogiri'
require 'pp'

url = "https://nomadlist.com/api/v2/list/cities/amsterdam-netherlands"

page = Nokogiri::HTML(open(url))

pp page

