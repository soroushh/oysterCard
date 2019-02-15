require "journey"
class JourneyLog
  def initialize(journey_class = Journey)
    @journey_class = journey_class
    @current_journey = nil
  end

  def start(station)
    @current_journey = @journey_class.new(station)
  end

  def finish(exit_station)
    current_journey.exit_station = exit_station
  end

  def journeys
    @journey_class.all
  end

  private
  def current_journey
    return @current_journey if @current_journey.exit_station == nil
    @current_journey = @journey_class.new()
  end

end
