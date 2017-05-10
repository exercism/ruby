#!/usr/bin/env ruby

require 'minitest/autorun'
require_relative 'robot_name'

class RobotTest < Minitest::Test
  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def setup
    Robot.forget
  end

  def test_can_create_a_robot
    skip
    refute_nil Robot.new
  end

  def test_has_name
    skip
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    skip
    robot = Robot.new
    original_name = robot.name
    assert_equal original_name, robot.name
  end

  def test_reset_changes_name
    skip
    robot = Robot.new
    original_name = robot.name
    robot.reset
    refute_equal original_name, robot.name
  end

  def test_reset_before_name_called_does_not_cause_an_error
    skip
    robot = Robot.new
    robot.reset
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_reset_multiple_times
    skip
    robot = Robot.new
    names = []
    5.times do
      robot.reset
      names << robot.name
    end
    # This will probably be 5, but name uniqueness is only a requirement
    # accross multiple robots and consecutive calls to reset.
    assert names.uniq.size > 1
  end

  def test_different_robots_have_different_names
    skip
    refute_equal Robot.new.name, Robot.new.name
  end

  # This test assumes you're using Kernel.rand as a source of randomness
  def test_different_name_when_chosen_name_is_taken
    skip
    same_seed = 1234
    Kernel.srand same_seed
    robot_1 = Robot.new
    name_1  = robot_1.name
    Kernel.srand same_seed
    robot_2 = Robot.new
    name_2 = robot_2.name
    refute_equal name_1, name_2
  end

  def test_generate_all_robots
    skip
    all_names_count = 26 * 26 * 1000
    time_limit = Time.now + 60 # seconds
    seen_names = Hash.new(0)
    robots = []
    while seen_names.size < all_names_count && Time.now < time_limit
      robot = Robot.new
      seen_names[robot.name] += 1
      robots << robot
    end
    timeout_message = "Timed out trying to generate all possible robots"
    assert_equal all_names_count, robots.size, timeout_message
    assert seen_names.values.all? { |count| count == 1 }, "Some names used more than once"
    assert seen_names.keys.all? { |name| name.match(NAME_REGEXP) }, "Not all names match #{NAME_REGEXP}"
  end

  def test_version
    assert_equal 3, BookKeeping::VERSION
  end
end
