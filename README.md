# oystercard

irb =>
require_relative "./lib/oystercard.rb"
require_relative "./lib/journey.rb"
require_relative "./lib/journey_log.rb"
require_relative "./lib/station.rb"
journey_log = JourneyLog.new
a = Station.new("adf",5)
journey_log.start(a)
b = Station.new("abc",3)
journey_log.finish(b)
journey_log.journeys
