# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'
SCHEDULER.every '1m', first_in: 0 do |_job|
  rows = ''
  time = Time.new
	wday = time.wday - 1
  uri = URI("http://127.0.0.1:8000/front/get_timetable/#{wday}/")
  tmtable = JSON.parse(Net::HTTP.get(uri))
  send_event('timetable', tmtable)

end
