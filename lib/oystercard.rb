class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance
  attr_reader :entry_station

  def initialize(balance = 0)
    @balance = balance
    @entry_station = nil
  end


  def top_up(amount)
    fail 'Max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end


  def in_journey?
    @entry_station != nil
  end


  def touch_in(station = double)
    raise 'Card already touched in' if in_journey?
    raise 'Not enough balance' if @balance < MIN_BALANCE
    @entry_station = station
  end


  def touch_out
    deduct(MIN_BALANCE)
    @entry_station = nil
  end


private

  def deduct(amount = MIN_BALANCE)
    @balance -= amount
  end
    

end
