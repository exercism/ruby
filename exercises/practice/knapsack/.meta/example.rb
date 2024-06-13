# This brute-force solution is not as efficient as an approach that uses dynamic
# programming, such as the former example solution in Ruby:
# https://github.com/exercism/ruby/blob/8925745e6301a56cadb49f18b91b19778e9e6642/exercises/practice/knapsack/.meta/example.rb
#
# But this solution is simpler, and the tests still run in <100 ms, so it would
# only be unsuitable for huge input sets.
class Knapsack
  private attr_reader :max_weight

  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    item_combinations = (1..items.length).flat_map { |n| items.combination(n).to_a }

    item_combinations
      .reject { _1.sum(&:weight) > max_weight }
      .map { _1.sum(&:value) }
      .max || 0
  end
end
