require_relative('oystercard.rb')
require_relative('journey.rb')

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station, :journeys, :current_journey, :working_journey

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
    @working_journey = Journey.new
  end


  def top_up(amount)
    fail 'Max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)
    deduct(@working_journey.fare_touch_in)
    raise 'Not enough balance' if @balance < MIN_BALANCE
    journey = Journey.new(station)
    @working_journey = journey
  end

  def touch_out(exit)
    deduct(@working_journey.fare_touch_out)
    record_journey
    @working_journey.exit_station = exit
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

end
