require 'nokogiri'
require 'open-uri'
require_relative '../bin/environment.rb'


class Scraper

  def initialize(database)
    @db = database
  end


  def scrape
    @pokemon_list = Nokogiri::HTML(open('pokemon_index.html')).css("div.infocard-tall-list span.infocard-tall")
    @pokemon_list.each do |pokemon|
      name = pokemon.css('a.ent-name').text
      type = pokemon.css('small.aside').text
      type = type.gsub(" · ",", ")
      Pokemon.save(name,type,@db)
    end
  end

end

    # @pokemon_list = Nokogiri::HTML(open('../pokemon_index.html')).css("div.infocard-tall-list span.infocard-tall")
    # array = []

    # @pokemon_list.each do |pokemon|
    #   name = pokemon.css('a.ent-name').text
    #   type = pokemon.css('small.aside').text
    #   type = type.gsub(" · ",", ")
    #   array << [name,type]
    # end

    # puts array

