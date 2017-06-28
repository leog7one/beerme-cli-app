#beer_me.rb will require the files for the program
#Acts as the environment

require "pry"
require "nokogiri"
require "open-uri"

require_relative "beer_me/version"
require_relative "./beer_me/beer"
require_relative './beer_me/cli'
