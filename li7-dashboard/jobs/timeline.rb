# frozen_string_literal: true

MAX_DAYS_OVERDUE = -20
MAX_DAYS_AWAY = 356

config_file = File.dirname(File.expand_path(__FILE__)) + '/../timeline_data.yml'

SCHEDULER.every '6h', first_in: 0 do |_job|
  config = YAML.safe_load(File.open(config_file))
  if config['events'].nil?
    puts 'No events found :('
  else
    events = []
    today = Date.today
    no_event_today = true
    config['events'].each do |event|
      days_away = (Date.parse(event['date']) - today).to_i
      if (days_away >= 0) && (days_away <= MAX_DAYS_AWAY)
        events << {
          name: event['name'],
          date: event['date'],
          background: event['background']
        }
      elsif (days_away < 0) && (days_away >= MAX_DAYS_OVERDUE)
        events << {
          name: event['name'],
          date: event['date'],
          background: event['background'],
          opacity: 0.5
        }
      end

      no_event_today = false if days_away == 0
    end

    if no_event_today
      events << {
        name: 'TODAY',
        date: today.strftime('%a %d %b %Y'),
        background: 'gold'
      }
    end

    send_event('a_timeline', events: events)
  end
end
