class BeerMe::Beer
	attr_accessor :name, :style, :reviews, :score

	#set the inital value of beers to be an empty array that can hold the beers
	@@beers = []

	def initialize
		@@beers << self
	end

	def self.all
		@@beers
	end

	def self.scrape_beers_site
		#obtains the page from ratebeer as nokogiri elements
		doc = Nokogiri::HTML(open("https://www.ratebeer.com/Ratings/TopOfTheMonth.asp"))

		#List the beers of the month
		#Use 'tr' to get the rows that contains the info for each beer
		#each row is an array of items 
		#the name of the beer is the [1] element
		beer_rows = doc.css('tr')
		
		beer_rows.each_with_index do |row, i|
			#since the iteration will bring back the first row and that row has no info we want to skip the first one
			if i != 0 
				beer = BeerMe::Beer.new
				beer.name = row.css('td')[1].text
				beer.style = row.css('td')[4].text
				beer.reviews = row.css('td')[3].text
				beer.score = row.css('td')[2].text
				
			end
		end
	end


end