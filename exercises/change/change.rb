class Change
  class << self
    def generate(amount, coins)
      # write the algorithm
      # Given an infinite supply of coins with different values
      # find the smallest number of coins needed to make a desired
      # amount of change.
      # m = [0] * (amount + 1)
      # m[0] = 1

      m = [[0] * (coins.length + 1), [0] * (amount + 1)]
      for i in (0...amount + 1)
        m[0][i] = i
      end
      m

      for c in (1...coins.length + 1)
        for r in (1...amount + 1)
          if coins[c - 1] == r
            m[c][r] = 1
          elsif coins[c - 1] > r
            m[c][r] = m[c - 1][r]
          else
            m[c][r] = [m[c - 1][r], 1 + m[c][r - coins[c - 1]]].min
          end
        end
      end
      return m[-1][-1]
    end
  end
end


# 1) there is one coin equal to the desired change in the array
#   if so, return coin
# 2) there are not enough coins to provide accurate change
# 3) there will require n amount of coins to equal change (the whole array)
