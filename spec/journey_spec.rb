require 'journey'

describe Journey do
 it "stores the entry station" do
   journey = Journey.new("aldgate")
   expect(journey.entrystation).to eq "aldgate"
 end

end
