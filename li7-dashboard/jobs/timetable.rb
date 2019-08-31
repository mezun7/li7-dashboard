# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'
SCHEDULER.every '1m', first_in: 0 do |_job|
  time = Time.new
  uri = URI("http://timetable.litsey7.com/front/get_timetable/")
  tmtable = JSON.parse(Net::HTTP.get(uri))
  send_event('timetable', tmtable)

end
