# bringing in 2 rubygems
require 'open-uri'
# read and search URLs
require 'nokogiri'

url = "https://www.wikipedia.org/wiki/List_of_current_NBA_team_rosters"
# open URL and store the HTML in a variable page
page = Nokogiri::HTML(open(url))

# gathers all NBA teams as their li class starts with li.toclevel-3
puts page.css('li.toclevel-3').text

# gather all nba players and their colleges
# class (period), id (hashtag), anything else []
# puts page.css('td[style="text-align:left;"]')

page.css('td[style="text-align:left;"]').each_with_index do |line, i| 
    if i % 2 == 0
      print "Player name: " + line.text + ", "
    else 
      puts "College: " + line.text
    end 
end 



