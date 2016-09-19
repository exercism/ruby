require 'byebug'
class Change
  class << self
    def generate(amount, coins_supply)
      # Given a supply of coins with different values
      # Keep track of possible coins combinations
      # Go through the supply of coins
        # Keep track of remaining coins
        # Keep track of the remaining amount
        # If the remaining amount divided by coin is bigger than 0,
          # Divide the remaining amount by coin as x,
          # Store the coin x number of times into the remaining coins arr
          # The remaining amount is original amount substracted by the total number of remaining coins
      # Return coins
      # Check if coins combination length is longer or shorter than the previous one
        # If shorter, return that one
        # If longer, return the previous one
      available_coins = coins_supply.sort {|a, b| b <=> a}
      coins = []
      remaining_amount = amount

      available_coins.each do |coin|
        if (remaining_amount/coin).to_i > 0
          ((remaining_amount/coin).to_i).times do
            coins << coin
            debugger
          end
        end
        if coins.length > 0
          remaining_amount = amount - coins.inject(:+)
        elsif coins.length == 0
          remaining_amount = amount
        end
      end
      coins.sort
    end
  end
end
