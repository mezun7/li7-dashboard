# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

ind = 0
SCHEDULER.every '15s', first_in: 0 do |_job|
  BASE_URL = 'http://timetable.litsey7.com'
  url_announcement = "#{BASE_URL}/front/announcements/?ind=#{ind}"
  url_quote = "#{BASE_URL}/front/quote/?ind=#{ind}"

  p url_announcement

  # send_event('quote', { title: random_quote["author"], text: random_quote["text"], moreinfo: title[random_quote["lang"]] })
  quote = JSON.parse(Net::HTTP.get(URI(url_announcement)))
  quote = JSON.parse(Net::HTTP.get(URI(url_quote))) if quote.empty?
  send_event('quote', title: quote['title'], text: quote['text'], icon: quote['icon'])
  ind += 1
  ind %= 1000
end
