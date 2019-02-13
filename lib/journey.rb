require_relative('oystercard.rb')

class Journey
  attr_reader :entrystation

def initialize(station = nil)
  @entrystation = station
end

def exit(station = nil)
  @exitstation = station
end

def fare
  return 6 if @entrystation == nil || @exitstation == nil
  return 1
end

end
