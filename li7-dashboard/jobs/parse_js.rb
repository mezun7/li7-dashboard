# frozen_string_literal: true

# require 'net/http'
# require 'uri'
# require 'openssl'
# url = URI.parse('https://api.weather.yandex.ru/v1/informers/')
# req = Net::HTTP::Get.new(url.path)
# req.add_field('X-Yandex-API-Key', '930048d3-b0fd-48ed-9e9b-fe830114b401')
# puts req.each_header
# res = Net::HTTP.new(url.host, url.port).start do |http|
#   http.request(req)
# end
# puts res.body
