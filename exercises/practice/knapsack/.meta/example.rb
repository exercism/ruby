# This solution uses dynamic programming to memoize solutions to overlapping
# subproblems, so that they don't need to be recomputed. It's essentially a
# recursive solution that remembers best-so-far outputs of previous inputs. The
# algorithm has a time complexity of O(n * W), where n is the number of items
# and W is the knapsack's maximum weight.
class Knapsack
  def initialize(max_weight)
    @max_weight = max_weight
  end

  def max_value(items)
    # e.g. max_values[3] is the maximum value so far for a maximum weight of 3.
    max_values = Array.new(@max_weight + 1, 0)

    items.each do |item|
      @max_weight.downto(item.weight) do |weight|
        value_with_item = max_values[weight - item.weight] + item.value

        max_values[weight] = [max_values[weight], value_with_item].max
      end
    end

    max_values[@max_weight]
  end
end
