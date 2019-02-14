require 'journey'
require 'oystercard'

describe Journey do
  let(:station){ double :station}

  it "stores the entry station" do
    journey = Journey.new("aldgate")
    expect(journey.entry_station).to eq "aldgate"
  end

  it "remembers the entry station after touch_in" do
    oystercard = Oystercard.new
    oystercard.top_up(5)
    expect(oystercard.touch_in(station).entry_station).to eq station
  end

  it "has an exit_station after touch_out" do
    oystercard = Oystercard.new
    oystercard.top_up(10)
    oystercard.touch_in("aldgate")
    oystercard.touch_out("abc")
    expect(oystercard.working_journey.exit_station).to eq("abc")
  end
end
