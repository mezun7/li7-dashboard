class Dashing.Klimato extends Dashing.Widget

  onData: (data) ->
    @setBackgroundClassBy parseInt(data.temperature, 10), data.format

  setBackgroundClassBy: (temperature, format) ->
    @removeBackgroundClass()

    colorLevel = @findColorLevelBy temperature, format
    $(@node).addClass "klimato-temperature-#{colorLevel}"

  removeBackgroundClass: ->
    classNames = $(@node).attr("class").split " "

    for className in classNames
      match = /klimato-temperature-(.*)/.exec className
      $(@node).removeClass match[0] if match

  findColorLevelBy: (temperature, format) ->
    ranges = { 0: 0,  1: [1..5],   2: [6..10],  3: [11..15], 4: [16..20], 5: [21..25], 6: 25 }
    switch
      when temperature <= ranges[0] then return 0
      when temperature in ranges[1] then return 1
      when temperature in ranges[2] then return 2
      when temperature in ranges[3] then return 3
      when temperature in ranges[4] then return 4
      when temperature in ranges[5] then return 5
      when temperature >  ranges[6] then return 6

  temperatureRangesFor: (format) ->
    ranges =
      c: { 0: 0,  1: [1..5],   2: [6..10],  3: [11..15], 4: [16..20], 5: [21..25], 6: 25 }
      f: { 0: 32, 1: [33..41], 2: [42..50], 3: [51..59], 4: [60..68], 5: [69..77], 6: 77 }
    ranges[format]
