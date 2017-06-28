How To Build a CLI Gem

1. Plan Your gem, imagine your interface

2. Start with Project Stucture - Google(bundler)

3. Start with entry point - the 'run' file.

4. force that to build the CLI Interface

5. Stub out the interface

6. Start making things real

7. Discover Objects

8. Program

 - A command line interface for top beers of the month from ratebeer.com
 - user types beer-me
 - returns list of beers

 - user chooses number for info on beer
 - shows beer style, score and number of reviews


 what is a beer?

 	Beer has a name
 	Beer has style
 	Beer has score
 	Beer has reviews

 NEED TO SOLVE: As of 6/28/17, have one issue left.
 	- When entering a number not on the list, the error "undefined method `css' for nil:NilClass (NoMethodError)" comes up.
 		Need to find way to make it state : please choose a valid number fir more info.