# oystercard

irb =>
require_relative "./lib/oystercard.rb"
require_relative "./lib/journey.rb"
require_relative "./lib/journeyLog.rb"
require_relative "./lib/station.rb"
journey_log = JourneyLog.new
journey_log.start(Station.new("oldgate", 3))
journey_log.finish(Station.new("oldgate", 3))
journey_log.journeys
