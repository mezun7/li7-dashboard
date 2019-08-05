# frozen_string_literal: true

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require 'json'
require 'net/http'
require 'uri'

SCHEDULER.every '1m', first_in: 0 do |job|

	uri2 = URI('http://127.0.0.1:8000/front/announcements/')
	quotes = JSON.parse(Net::HTTP.get(uri2))

#	send_event('quote', { title: random_quote["author"], text: random_quote["text"], moreinfo: title[random_quote["lang"]] })
	send_event('quote', title: quotes[0]['title'], text: quotes[0]['text'])
end