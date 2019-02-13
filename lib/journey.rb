class Journey
  attr_reader :entrystation

def initialize(station = nil)
  @entrystation = station
end

def exit(station = nil)
  @exitstation = station
end


end
