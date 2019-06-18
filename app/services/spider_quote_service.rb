require 'nokogiri'
require 'open-uri'

class SpiderQuoteService < ApplicationService
  attr_reader :tag

  def initialize(tag)
    @tag = tag
    @base_uri = ENV['QUOTE_TO_SCRAPE_URL']
  end
  
  def call
    tag_uri = "#{@base_uri}/tag/#{tag}"  
    page = 1  
    quotes = Array.new
    
    loop do
      doc = Nokogiri::HTML(open("#{tag_uri}/page/#{page}"))
      quotes_doc = doc.css('.quote')
      page += 1
  
      quotes_doc.each do |attributes|
        data = { 
          quote: attributes.css('.text').inner_html,
          author: attributes.css('.author').inner_html,
          author_about: "#{@base_uri}#{attributes.xpath('span//a/@href').text.strip}",
          tags: attributes.css('a.tag').map{|tag| tag.text}
        }
        quote = Quote.create data
        quotes << quote
      end
  
      break if doc.css('.quote').empty?
    end
    
    quotes
  end
end