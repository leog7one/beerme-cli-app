#CLI Controller
require 'pry'

class BeerMe::CLI

	def call
		doc = Nokogiri::HTML(open("https://www.ratebeer.com/Ratings/TopOfTheMonth.asp"))
		month_title = doc.css("h1").text
		puts ""
		puts "*****************************************"
		puts "******** " + month_title + "*********"
		puts "*****************************************"
		puts ""
		BeerMe::Beer.scrape_beers_site
		list_beers
		menu
		goodbye
	end

	def list_beers
		BeerMe::Beer.all.each.with_index(1) do |beer,i|
			puts "#{i}. #{beer.name}"
		end
	end


	def menu
		input = nil
		while input != 'exit'
			puts ""
			puts "Enter beer number to display Beer Info or type 'list' to see the list again or type 'exit':"
			input = gets.strip.downcase
		
			if input.to_i.between?(1, BeerMe::Beer.all.length)
				#grabs the row based on input number and pulls the info for style, score and review number using nokogiri.
				beer = BeerMe::Beer.all[input.to_i - 1]

				puts "Beer Style: #{beer.style}"
				puts "Beer Score: #{beer.score}"
				puts "Beer Reviews: #{beer.reviews}"

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