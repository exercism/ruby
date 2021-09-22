require 'minitest/autorun'
require_relative 'assembly_line'

class AssemblyLineTest < Minitest::Test
  def test_production_rate_per_hour_for_speed_one
    assert_in_delta 221.0, AssemblyLine.new(1).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_two
    assert_in_delta 442.0, AssemblyLine.new(2).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_three
    assert_in_delta 663.0, AssemblyLine.new(3).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_four
    assert_in_delta 884.0, AssemblyLine.new(4).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_five
    assert_in_delta 994.5, AssemblyLine.new(5).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_six
    assert_in_delta 1193.4, AssemblyLine.new(6).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_seven
    assert_in_delta 1392.3, AssemblyLine.new(7).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_eight
    assert_in_delta 1591.2, AssemblyLine.new(8).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_nine
    assert_in_delta 1591.2, AssemblyLine.new(9).production_rate_per_hour, 0.0001
  end

  def test_production_rate_per_hour_for_speed_ten
    assert_in_delta 1701.7, AssemblyLine.new(10).production_rate_per_hour, 0.0001
  end

  def test_working_items_per_minute_for_speed_one
    assert_equal 3, AssemblyLine.new(1).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_five
    assert_equal 16, AssemblyLine.new(5).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_eight
    assert_equal 26, AssemblyLine.new(8).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_nine
    assert_equal 26, AssemblyLine.new(9).working_items_per_minute
  end

  def test_working_items_per_minute_for_speed_ten
    assert_equal 28, AssemblyLine.new(10).working_items_per_minute
  end
end
