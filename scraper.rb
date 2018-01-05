require 'HTTParty'
require 'Nokogiri'

class Scraper
  
  attr_accessor :parse

  def initialize

    doc = HTTParty.get('https://www.amazon.de/gp/product/B071X6N931')

    @parse ||= Nokogiri::HTML(doc)

    value = parse.xpath('//*[@id="priceblock_ourprice"]').text.match /\d+[.,]\d+/

    puts value

  end
  
  scraper = Scraper.new 
	
end
