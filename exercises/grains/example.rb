module BookKeeping
  VERSION = 1
end

module Grains
  def self.square(number)
    fail ArgumentError if number <= 0 || number > 64
    2**(number - 1)
  end

  def self.total
    2**64 - 1
  end
end
