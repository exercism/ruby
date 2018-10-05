class Change
  attr_reader :coins, :target

  def initialize(coins, target)
    @coins  = coins.sort.reverse
    @target = target
    @total_change = []
  end

  def generate
    return [] if target.zero?

    calculate_change(coins, [], target)
    raise ArgumentError if total_change.none?

    total_change.sort
  end

  def self.generate(coins, target)
    new(coins, target).generate
  end

  private

  attr_accessor :total_change

  def calculate_change(current_coins, current_change, current_value)
    available_coins = current_coins.reject {|d| d > current_value }

    save_change(current_change) if current_value.zero?

    return if has_more_coins?(current_change)

    each_group(available_coins) do |coin, group|
      calculate_change(group, current_change + [coin], current_value - coin)
    end
  end

  def save_change(contents)
    return if has_more_coins?(contents)

    self.total_change = contents
  end

  def has_more_coins?(contents)
    total_change.any? && (total_change.length < contents.length)
  end

  def each_group(array)
    array.length.times do |n|
      yield(array[n], array[n..-1])
    end
  end

end
