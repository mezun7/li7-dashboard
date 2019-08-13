# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

SCHEDULER.every '15s', first_in: 0 do |_job|
  BASE_URL = 'http://127.0.0.1:8000'
  url_announcement = "#{BASE_URL}/front/announcements/"
  url_quote = "#{BASE_URL}/front/quote/"

  # send_event('quote', { title: random_quote["author"], text: random_quote["text"], moreinfo: title[random_quote["lang"]] })
  quote = JSON.parse(Net::HTTP.get(URI(url_announcement)))
  quote = JSON.parse(Net::HTTP.get(URI(url_quote))) if quote.empty?
  send_event('quote', title: quote['title'], text: quote['text'], icon: quote['icon'])
end
