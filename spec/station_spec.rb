require 'station'

describe Station do
  it "it has a name variable" do
    station = Station.new("aldgate")
    expect(station.name).to eq("aldgate")
  end
end
