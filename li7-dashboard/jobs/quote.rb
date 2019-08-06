# frozen_string_literal: true

# :first_in sets how long it takes before the job is first run. In this case, it is run immediately
require 'json'
require 'net/http'
require 'uri'

SCHEDULER.every '15s', first_in: 0 do |_job|
  BASE_URL = 'http://127.0.0.1:8000/'
  url_announcement = "#{BASE_URL}front/announcements/"
  url_quote = "#{BASE_URL}front/quote/"
  uri2 = URI(url_announcement)
  quotes = JSON.parse(Net::HTTP.get(uri2))

  #  send_event('quote', { title: random_quote["author"], text: random_quote["text"], moreinfo: title[random_quote["lang"]] })
  if !quotes.empty?
    puts 'Here'
    send_event('quote', title: quotes['title'], text: quotes['text'])
  else
    uri3 = URI(url_quote)
    quotes = JSON.parse(Net::HTTP.get(uri3))
    send_event('quote', title: quotes['title'], text: quotes['text'])
  end
end
