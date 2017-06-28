#CLI Controller

class BeerMe::CLI

	def call
		doc = Nokogiri::HTML(open("https://www.ratebeer.com/Ratings/TopOfTheMonth.asp"))
		month_title = doc.css("h1").text
		puts ""
		puts "*****************************************"
		puts "******** " + month_title + "*********"
		puts "*****************************************"
		puts ""
		
		list_beers
		menu
		goodbye
	end

	def list_beers
		@@beers = BeerMe::Beer.scrape_beers_site
	end

	def menu
		input = nil
		while input != 'exit'
			puts "Enter beer number to display Beer Info or type 'list' to see the list again or type 'exit':"
			input = gets.strip.downcase
		
			case input
			when "1"
				puts "Beer Style: Style"
				puts "Beer Score: Score"
				puts "Beer Reviews: Reviews"
			when "2"
				puts "Beer Style: Style"
				puts "Beer Score: Score"
				puts "Beer Reviews: Reviews"
			when "list"
				list_beers
			end
		end
	end

	def goodbye
		puts "See you next month for the new best beers!"
	end

end