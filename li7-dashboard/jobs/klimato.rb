# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'

# WOEID for location:
# http://woeid.rosselliot.co.nz

# Units for temperature:
# f: Fahrenheit
# c: Celsius
BASE_URL2 = 'http://timetable.litsey7.com/front/weather/'
format = "c"

SCHEDULER.every '1m', first_in: 0 do |_job|
  results = JSON.parse(Net::HTTP.get(URI(BASE_URL2)))

  if results
    temp = results['temp']
    feels_like = results['feels']
    city = 'Казань'
    send_event 'klimato', location: city, temperature: temp, feels: feels_like, format => "c", :code => 0, :update => results['update'], :icon => results['icon']
  end
end
