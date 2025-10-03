require 'minitest/autorun'
require_relative 'secret_handshake'

class SecretHandshakeTest < Minitest::Test
  def test_wink_for_1
    # skip
    actual = SecretHandshake.new(1).commands
    expected = ["wink"]
    assert_equal expected, actual
  end

  def test_double_blink_for_10
    skip
    actual = SecretHandshake.new(2).commands
    expected = ["double blink"]
    assert_equal expected, actual
  end

  def test_close_your_eyes_for_100
    skip
    actual = SecretHandshake.new(4).commands
    expected = ["close your eyes"]
    assert_equal expected, actual
  end

  def test_jump_for_1000
    skip
    actual = SecretHandshake.new(8).commands
    expected = ["jump"]
    assert_equal expected, actual
  end

  def test_combine_two_actions
    skip
    actual = SecretHandshake.new(3).commands
    expected = ["wink", "double blink"]
    assert_equal expected, actual
  end

  def test_reverse_two_actions
    skip
    actual = SecretHandshake.new(19).commands
    expected = ["double blink", "wink"]
    assert_equal expected, actual
  end

  def test_reversing_one_action_gives_the_same_action
    skip
    actual = SecretHandshake.new(24).commands
    expected = ["jump"]
    assert_equal expected, actual
  end

  def test_reversing_no_actions_still_gives_no_actions
    skip
    actual = SecretHandshake.new(16).commands
    expected = []
    assert_equal expected, actual
  end

  def test_all_possible_actions
    skip
    actual = SecretHandshake.new(15).commands
    expected = ["wink", "double blink", "close your eyes", "jump"]
    assert_equal expected, actual
  end

  def test_reverse_all_possible_actions
    skip
    actual = SecretHandshake.new(31).commands
    expected = ["jump", "close your eyes", "double blink", "wink"]
    assert_equal expected, actual
  end

  def test_do_nothing_for_zero
    skip
    actual = SecretHandshake.new(0).commands
    expected = []
    assert_equal expected, actual
  end
end
