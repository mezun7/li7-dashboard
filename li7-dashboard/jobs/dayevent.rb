# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'
SCHEDULER.every '10s', first_in: 0 do |_job|
  time = Time.new
  uri = URI("http://127.0.0.1:8000/front/dayevents/")
  dayevents = JSON.parse(Net::HTTP.get(uri))
  send_event('dayevent', dayevents)

end
