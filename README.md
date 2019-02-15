# oystercard

irb =>
require_relative "./lib/oystercard.rb"
require_relative "./lib/journey.rb"
require_relative "./lib/journey_log.rb"
require_relative "./lib/station.rb"
journey_log = JourneyLog.new
journey_log.start(Station.new("oldgate", 3))
