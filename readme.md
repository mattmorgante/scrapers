### Notes: 

* How much does it cost to sleep around the world? 
* Hostelworld's source has two prices for each page - must remove odd/even values 
* Must delete all zeroes using prices_array.delete(0)
* If you do 3 pages for mumbai, it will re-route and run the array twice 
 -- is this a problem if you're taking the average? 
* Note: these prices were pulled on July 4th, 2016 - could be high season for some and low season for others

 ### Todo: 
 * Put scrapped data into an HTML table: Broken down by 
 * Should the be a rails app? Populate data from CSV files into DB 
 * One .rb file for each city - Berlin.rb, Amsterdan.rb etc 
 ** Regions: Europe, North America, Central America, South America, Southeast Asia, Asia, Oceania, Africa 
 * Pick 10-15 cities in each region and save all the results to the database 
 * DB structure - each region has_many cities && each city belongs_to a region
 * Will need like 100 .rb files for Hostelworld and 100 more for Airbnb. Is there an easier way to do this? 