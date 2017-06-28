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
		beer_info
		goodbye
	end

	def list_beers
		@@beers = BeerMe::Beer.scrape_beers_site
	end

	def beer_info
		@@info = BeerMe::Beer.scrape_beer_info
	end

	def menu
		input = nil
		while input != 'exit'
			puts ""
			puts "Enter beer number to display Beer Info or type 'list' to see the list again or type 'exit':"
			input = gets.strip.downcase
		
			if input.to_i > 0 && input.to_i < beer_info.length
				#grabs the row based on input number and pulls the info for style, score and review number using nokogiri.
				info = beer_info[input.to_i]
				beer_style = info.css('td')[4].text
				beer_score = info.css('td')[2].text
				beer_reviews = info.css('td')[3].text

				puts "Beer Style: #{beer_style}"
				puts "Beer Score: #{beer_score}"
				puts "Beer Reviews: #{beer_reviews}"

			elsif input == "list"
				list_beers

			elsif input == "exit"

			elsif 
				puts "Please choose a valid number."
			
				
			end
		end
	end

	def goodbye
		puts "See you next month for the new best beers!"
	end

end