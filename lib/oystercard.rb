require_relative('oystercard.rb')
require_relative('journey.rb')

class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance, :entry_station, :working_journey

  def initialize(balance = 0)
    @balance = balance
    @working_journey = Journey.new
  end


  def top_up(amount)
    fail 'Max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    deduct(@working_journey.fare_touch_in)
    raise 'Not enough balance' if @balance < MIN_BALANCE
    @working_journey = Journey.new(station)
  end

  def touch_out(exit)
    deduct(@working_journey.fare_touch_out)
    @working_journey.exit_station = exit
  end

private

  def deduct(amount = MIN_BALANCE)
    @balance -= amount
  end

end
