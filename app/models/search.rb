require 'nokogiri'
require 'open-uri'

class Search < ApplicationRecord
	include HTTParty
	def self.scrape_home_depot(input)
		if input.include? " "
			white_space_input = input.split(" ").join("+")
		else
			white_space_input = input
		end
		encoded_url = URI.encode("http://www.homedepot.com/s/#{white_space_input}?NCNI-5")
		page = HTTParty.get(encoded_url)
		parse_page = Nokogiri::HTML(page)
		items_array = []
		index = 0 
		while index < 24 do
			if parse_page.css('div.plp-pod__image img.stretchy')[index]['data-original']
				img_src = parse_page.css('div.plp-pod__image img.stretchy')[index]['data-original'].strip
			else
				img_src = parse_page.css('div.plp-pod__image img.stretchy')[index]['src'].strip
			end

			description = parse_page.css('div.pod-plp__description a')[index].text.strip
			model_number = parse_page.css('div.pod-plp__model')[index].text.strip
			price = parse_page.css('div.price')[index].text.strip.match(/\d+/)[0].to_i / 100
			link = "http://homedepot.com"
			link += parse_page.css('div.pod-plp__description a')[index]['href']

			item = { 
				description: description,
				image: img_src,
				model: model_number,
				price: price,
				link: link,
				merchant: "Home Depot"
			
			}

			items_array.push(item)
			index += 1
		end
		items_array
	end

	def self.scrape_lowes(input)
		if input.include? " "
			white_space_input = input.split(" ").join("+")
		else
			white_space_input = input
		end
		encoded_url = URI.encode("http://www.lowes.com/search?searchTerm=#{white_space_input}")
		page = HTTParty.get(encoded_url)
		parse_page = Nokogiri::HTML(page)
		items_array = []
		index = 0 
		while index < 24 do
			img_src = parse_page.css('div.product-container img.js-pl-lazy-load-image')[index]['data-src'].strip
			description = parse_page.css('p.product-title')[index].text.strip
			
			# price = parse_page.css("div.v-spacing-mini span.h5")[index].text.strip
			item = { 
				description: description,
				image: img_src,
				price: nil,
				merchant: "Lowe's"
			}

			items_array.push(item)
			index += 1
		end
		items_array
	end
end
