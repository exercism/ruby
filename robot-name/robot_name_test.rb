require 'minitest/autorun'
require_relative 'robot_name'

class RobotTest < Minitest::Test
  COMMAND_QUERY = <<-MSG
    Command/Query Separation:
    Query methods should generally not change object state.
  MSG

  def test_has_name
    # rubocop:disable Lint/AmbiguousRegexpLiteral
    assert_match /^[A-Z]{2}\d{3}$/, Robot.new.name
    # rubocop:enable Lint/AmbiguousRegexpLiteral
  end

  def test_name_sticks
    skip
    robot = Robot.new
    robot.name
    assert_equal robot.name, robot.name
  end

  def test_different_robots_have_different_names
    skip
    # rubocop:disable Lint/UselessComparison
    assert Robot.new.name != Robot.new.name
    # rubocop:enable Lint/UselessComparison
  end

  def test_reset_name
    skip
    robot = Robot.new
    name = robot.name
    robot.reset
    name2 = robot.name
    assert name != name2
    assert_equal name2, robot.name, COMMAND_QUERY
    # rubocop:disable Lint/AmbiguousRegexpLiteral
    assert_match /^[A-Z]{2}\d{3}$/, name2
    # rubocop:enable Lint/AmbiguousRegexpLiteral
  end
end
