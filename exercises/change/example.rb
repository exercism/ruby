#This solution was found here: http://rubyquiz.com/quiz154.html
#It passes all the tests, but we do not understand the recursion block.
#BYOAlgorithm! :)

class Change
  attr_reader :coins, :target

  def initialize(coins, target)
    @coins = coins
    @target = target
  end

 def find_fewest_coins
     coins.sort.reverse!

     # memoize solutions
     optimal_change = Hash.new do |hash, target|
       hash[target] = if target < coins.min
         [] #if target is less than smallest coin, no change
       elsif coins.include?(target)
         [target] #if target is same as a single coin, return target
       else

         coins.
           # get rid of coins larger than target
          reject { |coin| coin > target }.

           # get rid of coins that are factors of other coins
           inject([]) {|mem, coin| mem.any? {|c| c%coin == 0} ? mem : mem+[coin]}.

           ## recurse
           map {|coin| [coin] + hash[target - coin]}.

           # prune unhelpful solutions
           reject { |change| change.inject(0, :+) != target }.

           # pick the smallest, empty if none
           min { |a, b| a.size <=> b.size } || []
       end
     end
     optimal_change[target]
    end

end
