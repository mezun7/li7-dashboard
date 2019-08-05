require 'json'
require 'net/http'
require 'uri'

string = '{"desc":{"someKey":"someValue","anotherKey":"value"},"main_item":{"stats":{"a":8,"b":12,"c":10}}}'

json2 = JSON.parse(string)
puts json2["desc"]["someKey"]

uri = URI('http://127.0.0.1:8000/front/get_timetable/1/')
puts JSON.parse(Net::HTTP.get(uri))['headers'][0]['value']

tmt = {
    1 => "hi"
}

puts tmt


uri2 = URI('http://127.0.0.1:8000/front/announcements/')
quotes = JSON.parse(Net::HTTP.get(uri2))
puts quotes[0]['title']