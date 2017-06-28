class BeerMe::Beer
	attr_accessor :name

	#set the inital value of beers to be an empty array that can hold the beers
	@@beers = []

	def initailize
		@@beers << self
	end

	def self.all
		@@beers
	end

	def self.scrape_beers_site
		#obtaions the page from ratebeer as nokogiri elements
		doc = Nokogiri::HTML(open("https://www.ratebeer.com/Ratings/TopOfTheMonth.asp"))

		#List the beers of the month
		#Use 'tr' to get th rows that contains the info for each beer
		#each row is an array of items 
		#the name of the beer is the [1] element
		beer_rows = doc.css('tr')
		index = 0
		beer_rows.each_with_index do |row, i|
			beer = BeerMe::Beer.new
			beer.name = row.css('td')[1].text
			#since the iteration will bring back the first row and that row has no info we want to skip the first one
			#the index of 0 we will skip it using 'next' and then put the rest as those are the beers.
			if i == 0
				next
			end
			puts "#{i}. #{beer.name}"
		end
	end
end