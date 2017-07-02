require 'minitest/autorun'
require_relative 'gigasecond'

# Common test data version: 1.0.0 61e7d70
class GigasecondTest < Minitest::Test
  def test_date_only_specification_of_time
    # skip
    assert_equal Time.utc(2043, 1, 1, 1, 46, 40), Gigasecond.from(Time.utc(2011, 4, 25, 0, 0, 0))
  end

  def test_second_test_for_date_only_specification_of_time
    skip
    assert_equal Time.utc(2009, 2, 19, 1, 46, 40), Gigasecond.from(Time.utc(1977, 6, 13, 0, 0, 0))
  end

  def test_third_test_for_date_only_specification_of_time
    skip
    assert_equal Time.utc(1991, 3, 27, 1, 46, 40), Gigasecond.from(Time.utc(1959, 7, 19, 0, 0, 0))
  end

  def test_full_time_specified
    skip
    assert_equal Time.utc(2046, 10, 2, 23, 46, 40), Gigasecond.from(Time.utc(2015, 1, 24, 22, 0, 0))
  end

  def test_full_time_with_day_roll_over
    skip
    assert_equal Time.utc(2046, 10, 3, 1, 46, 39), Gigasecond.from(Time.utc(2015, 1, 24, 23, 59, 59))
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 6, BookKeeping::VERSION
  end
end
