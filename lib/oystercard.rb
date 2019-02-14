require_relative('oystercard.rb')
require_relative('journey.rb')

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station, :journeys, :current_journey

  def initialize(balance = 0)
    @balance = balance
    reset
    @journeys = []
    @current_journey = nil
  end


  def top_up(amount)
    fail 'Max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    raise 'Card already touched in' if in_journey?
    raise 'Not enough balance' if @balance < MIN_BALANCE
    journey = Journey.new(station)
    @current_journey = journey
  end

  def touch_out(exit)
    deduct(Oystercard::MIN_BALANCE)
    record_journey
    reset
  end

private

  def record_journey
    @exit_station = @exit
    @current_journey = Hash[:entry, @entry_station, :exit, @exit_station]
    @journeys << @current_journey
  end

  def deduct(amount = MIN_BALANCE)
    @balance -= amount
  end

  def reset
    @entry_station = nil
    @exit_station = nil
  end

end
