# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

string = '{"desc":{"someKey":"someValue","anotherKey":"value"},"main_item":{"stats":{"a":8,"b":12,"c":10}}}'
BASE_URL = 'http://127.0.0.1:8000/'

json2 = JSON.parse(string)
puts json2['desc']['someKey']
uri = URI("#{BASE_URL}front/get_timetable/1/")
puts ''
puts JSON.parse(Net::HTTP.get(uri))['headers'][0]['value']

tmt = {
  1 => 'hi'
}

puts tmt

uri2 = URI('http://127.0.0.1:8000/front/announcements/')
quotes = JSON.parse(Net::HTTP.get(uri2))
if !quotes.empty?
  puts 'empty'
else
  uri_quotes = URI("#{BASE_URL}front/quote/")
  quotes = JSON.parse(Net::HTTP.get(uri_quotes))
  puts quotes['title']
end
