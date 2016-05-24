#!/usr/bin/env ruby
# frozen_string_literal: false

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'robot_name'

class RobotTest < Minitest::Test
  DIFFERENT_ROBOT_NAME_SEED = 1234
  SAME_INITIAL_ROBOT_NAME_SEED = 1000

  COMMAND_QUERY = <<-MSG.freeze
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
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    refute_equal Robot.new.name, Robot.new.name
  end

  def test_reset_name
    skip
    Kernel.srand DIFFERENT_ROBOT_NAME_SEED
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    refute_equal name, name2
    assert_equal name2, robot.name, COMMAND_QUERY
    assert_match NAME_REGEXP, name2
  end

  def test_different_name_when_chosen_name_is_taken
    skip
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name1 = Robot.new.name
    Kernel.srand SAME_INITIAL_ROBOT_NAME_SEED
    name2 = Robot.new.name
    refute_equal name1, name2
  end

  def test_version
    skip
    assert_equal 2, BookKeeping::VERSION
  end
end
