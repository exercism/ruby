# see also https://gist.github.com/blairand/5237976
# see also https://gist.github.com/burtlo/89b0b817fdccf6bdf20f
class Series
  attr_reader :digits
  def initialize(numeric_string)
    @digits = numeric_string
  end

  def largest_product(length)
    @length = length
    fail ArgumentError.new('Not enough digits') if @length > digits.length
    analyzer
  end

  private

  def analyzer
    collection_of_digits
    reduce_to_product { validate { separate } }.max
  end

  def validate
    yield.take_while { |array| array.size == @length }
  end

  def reduce_to_product
    yield.map { |array| array.inject(1, :*) }
  end

  def separate
    0.upto(digits.length - 1).map.with_index do |_, index|
      digits[index, @length]
    end
  end

  def collection_of_digits
    @digits = digits.chars.map(&:to_i)
  end
end
