require 'minitest/autorun'
require_relative 'assembly_line'

class AssemblyLineTest < Minitest::Test
  def test_production_rate_per_hour_for_speed_zero
    assert_equal 0.0, AssemblyLine.production_rate_per_hour(0)
  end

  def test_production_rate_per_hour_for_speed_one
    assert_equal 221.0, AssemblyLine.production_rate_per_hour(1)
  end

  def test_production_rate_per_hour_for_speed_four
    assert_equal 884.0, AssemblyLine.production_rate_per_hour(4)
  end

  def test_production_rate_per_hour_for_speed_seven
    assert_equal 1392.3, AssemblyLine.production_rate_per_hour(7)
  end

  def test_production_rate_per_hour_for_speed_nine
    assert_equal 1591.2, AssemblyLine.production_rate_per_hour(9)
  end

  def test_production_rate_per_hour_for_speed_ten
    assert_equal 1701.7, AssemblyLine.production_rate_per_hour(10)
  end

  def test_working_items_per_minute_for_speed_zero
    assert_equal 0, AssemblyLine.working_items_per_minute(0)
  end

  def test_working_items_per_minute_for_speed_one
    assert_equal 3, AssemblyLine.working_items_per_minute(1)
  end

  def test_working_items_per_minute_for_speed_five
    assert_equal 16, AssemblyLine.working_items_per_minute(5)
  end

  def test_working_items_per_minute_for_speed_eight
    assert_equal 26, AssemblyLine.working_items_per_minute(8)
  end

  def test_working_items_per_minute_for_speed_nine
    assert_equal 26, AssemblyLine.working_items_per_minute(9)
  end

  def test_working_items_per_minute_for_speed_ten
    assert_equal 28, AssemblyLine.working_items_per_minute(10)
  end
end
