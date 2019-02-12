class Oystercard

  MAX_BALANCE = 90
  MIN_BALANCE = 1

  attr_reader :balance

  def initialize
    @balance = 0
    @in_use = false

  end

  def top_up(amount)
    fail 'Max balance of #{max_balance} exceeded' if amount + balance > MAX_BALANCE
    @balance += amount
  end


  def in_journey?
    @in_use
  end

  def touch_in
    raise 'Card already touched in' if in_journey?
    raise 'Not enough balance' if @balance < MIN_BALANCE
    @in_use = true
  end



  def touch_out
    deduct(MIN_BALANCE)
    @in_use = false

  end

private
    def deduct(amount = MIN_BALANCE)
      @balance -= amount

    end

end
