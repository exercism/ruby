require 'minitest/autorun'
require_relative 'microwave'

# Common test data version: 1.7.0 cacf1f1
class MicrowaveTest < Minitest::Test
  def test_one_second
    # skip
    assert_equal '00:01', Microwave.new(1).timer
  end

  def test_fifty_nine_seconds
    skip
    assert_equal '00:59', Microwave.new(59).timer
  end

  def test_sixty_seconds
    skip
    assert_equal '01:00', Microwave.new(60).timer
  end

  def test_one_minute
    skip
    assert_equal '01:00', Microwave.new(100).timer
  end

  def test_ninety_secods
    skip
    assert_equal '01:30', Microwave.new(90).timer
  end

  def test_one_minute_and_one_second
    skip
    assert_equal '01:01', Microwave.new(101).timer
  end

  def test_sixty_one_seconds
    skip
    assert_equal '01:01', Microwave.new(61).timer
  end

  def test_one_minute_and_fifty_nine_seconds
    skip
    assert_equal '01:59', Microwave.new(119).timer
  end

  def test_two_minutes
    skip
    assert_equal '02:00', Microwave.new(120).timer
  end

  def test_over_ten_minutes
    # skip
    assert_equal '10:01', Microwave.new(601).timer
  end
end
