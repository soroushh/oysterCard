require "journeyLog"

describe JourneyLog do
  it "We are able to make a journey log" do
    journey_log = JourneyLog.new()
  end

  let(:station) { double :station }
  let(:station_2) { double :station_2 }

  it { is_expected.to respond_to(:start).with(1).argument }

  it { is_expected.to respond_to(:finish).with(1).argument }

  it "keeps a log of journeys" do
    log = JourneyLog.new
    log.start(station)
    log.finish(station_2)
    journey = Journey.new(station,station_2)
    expect(log.journeys).to include(journey)
  end

end
