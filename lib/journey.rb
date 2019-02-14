require_relative('oystercard.rb')

class Journey
  attr_reader :entry_station

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
  end

  def exit(station = nil)
    @exit_station = station
  end

  def fare
    return 6 if @entry_station == nil || @exit_station == nil
    return 1
  end

end
