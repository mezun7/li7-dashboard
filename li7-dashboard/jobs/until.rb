require 'json'
require 'net/http'
require 'uri'

SCHEDULER.every '15s', first_in: 0 do |_job|
  BASE_URL = 'http://127.0.0.1:8000'
  url_next_lesson = "#{BASE_URL}/front/next_lesson/"

  next_lesson = JSON.parse(Net::HTTP.get(URI(url_next_lesson)))
  p(next_lesson)
  p(Time.now.inspect)
  send_event('until', title: next_lesson['title'], end: next_lesson['until'])
end
