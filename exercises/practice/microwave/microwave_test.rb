require 'minitest/autorun'
require_relative 'microwave'

class MicrowaveTest < Minitest::Test
  def test_one_second
    assert_equal '00:01', Microwave.new(1).timer
  end

  def test_fifty_nine_seconds
    assert_equal '00:59', Microwave.new(59).timer
  end

  def test_sixty_seconds
    assert_equal '01:00', Microwave.new(60).timer
  end

  def test_one_minute
    assert_equal '01:00', Microwave.new(100).timer
  end

  def test_ninety_seconds
    assert_equal '01:30', Microwave.new(90).timer
  end

  def test_one_minute_and_one_second
    assert_equal '01:01', Microwave.new(101).timer
  end

  def test_sixty_one_seconds
    assert_equal '01:01', Microwave.new(61).timer
  end

  def test_one_minute_and_fifty_nine_seconds
    assert_equal '01:59', Microwave.new(159).timer
  end

  def test_two_minutes
    assert_equal '02:00', Microwave.new(200).timer
  end

  def test_over_ten_minutes
    assert_equal '10:01', Microwave.new(1001).timer
  end

  def test_minute_overflow_adds_to_input_minutes
    assert_equal '03:12', Microwave.new(272).timer
  end
end
