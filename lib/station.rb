require_relative('oystercard.rb')

class Station

  attr_reader :name

  def initialize(name)
    @name = name
  end
end
