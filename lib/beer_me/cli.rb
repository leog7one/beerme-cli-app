#CLI Controller

class BeerMe::CLI

	def call
		puts "Top Beers of the Month"
		list_beers
		menu
	end

	def list_beers
		puts <<-DOC.gsub /^\s+/, ""
		1. Beer Name
		2. Beer Name 2
		DOC
	end

	def menu
		puts "Enter beer number to display Beer Info or type 'list' to see the beers again or type 'exit':"
	end

end