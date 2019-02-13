require 'station'

describe Station do
  it "it has a name variable" do
    station = Station.new("aldgate", 1)
    expect(station.name).to eq("aldgate")
  end

  it "it has a zone variable" do
    station = Station.new("aldgate", 1)
    expect(station.zone).to eq(1)
  end
end
