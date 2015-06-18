# see also https://gist.github.com/blairand/5237976
# see also https://gist.github.com/burtlo/89b0b817fdccf6bdf20f
class Series
  attr_reader :digits
  def initialize(numeric_string)
    @digits = numeric_string
  end

  def largest_product(length)
    @length = length
    validate_length
    return 1 if @digits.empty?
    collection_of_digits
    select_max { reduce_to_product  { validate  { separate } } }
  end

  private

  def validate_length
    @length > digits.length and
      fail(ArgumentError.new 'Not enough digits')
  end

  def validate
    yield.take_while { |array| array.size == @length }
  end

  def reduce_to_product
    yield.map { |array| array.inject(1, :*) }
  end

  def select_max
    yield.max
  end

  def separate
    digits.map.with_index do |_, index|
      digits[index, @length]
    end
  end

  def collection_of_digits
    @digits = digits.chars.map(&:to_i)
  end
end
