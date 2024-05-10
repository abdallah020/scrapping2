# scraping.rb
require 'nokogiri'
require 'open-uri'
require 'json'

class Scraper
  attr_reader :ministre_array

  def initialize
    @ministre_array = []
  end

  def scrap_ministre_name
    url = "https://www.sec.gouv.sn/le-gouvernement"
    html = URI.open(url)
    doc = Nokogiri::HTML(html)
     
    ministre_name = doc.xpath('//h4[contains(@class, "minister")]').map(&:text)
    ministre_fonc = doc.xpath('//p[contains(@class, "minister")]').map(&:text)
    
    ministre_name.each_with_index do |name, index|
      @ministre_array << { nom: name, fonction: ministre_fonc[index] }
    end
    
    @ministre_array.each do |ministre|
      puts "Nom: #{ministre[:nom]}"
      puts "Fonction: #{ministre[:fonction]}"
      puts ""
    end
    
    return @ministre_array
  end
end


