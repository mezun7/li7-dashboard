# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require 'json'
require 'net/http'
require 'uri'

SCHEDULER.every '1m', :first_in => 0 do |job|

	uri = URI('http://127.0.0.1:8000/front/get_timetable/1/')
	quotes = JSON.parse(Net::HTTP.get(uri))
	path = File.expand_path("../../quotes.json", __FILE__)
	file = File.read(path) 
	quotes_hash = JSON.parse(file)

	random_quote = quotes_hash.sample

	title = {
		"tr" => "Hikmetli soz",
		"tt" => "Hikmetle suz",
		"en" => "Word of wisdom",
		"ru" => "Slovo"
	}

#	send_event('quote', { title: random_quote["author"], text: random_quote["text"], moreinfo: title[random_quote["lang"]] })
	send_event('quote', { title: random_quote["author"], text: random_quote["text"] })
end