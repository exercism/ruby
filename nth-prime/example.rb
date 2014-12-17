require 'prime'

class Prime
  def self.nth(n)
    if n < 1
      message = 'There is no such thing. Be reasonable.'
      fail ArgumentError.new(message)
    end

    primes = 0
    i = 1
    while primes < n
      i += 1
      primes += 1 if Prime.prime?(i)
    end
    i
  end
end
