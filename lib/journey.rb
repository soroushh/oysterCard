require_relative('oystercard.rb')
require_relative("station.rb")

class Journey
  attr_reader :entry_station
  attr_accessor :exit_station

  def initialize(entry_station = nil, exit_station = nil)
    @entry_station = entry_station
    @exit_station = exit_station
    self.class.all << self
  end

  def exit(station = nil)
    @exit_station = station
  end

  def fare(exit)
    return (exit.zone - entry_station.zone).abs+1 if @exit_station == nil
    return 6 if @exit_station != nil
  end

  def set_exit(exit)
    self.exit_station = exit
  end

  def self.all
    @all ||= []
  end

end
