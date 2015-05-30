#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'robot_name'

class RobotTest < Minitest::Test
  COMMAND_QUERY = <<-MSG
    Command/Query Separation:
    Query methods should generally not change object state.
  MSG

  NAME_REGEXP = /^[A-Z]{2}\d{3}$/

  def test_has_name
    assert_match NAME_REGEXP, Robot.new.name
  end

  def test_name_sticks
    skip
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    skip
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    skip
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    assert name != name2
    assert_equal name2, robot.name, COMMAND_QUERY
    assert_match NAME_REGEXP, name2
  end
end
