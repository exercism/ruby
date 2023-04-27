require 'minitest/autorun'
require_relative 'secret_handshake'

class SecretHandshakeTest < Minitest::Test
  def test_wink_for_1
    # skip
    secret_handshake = SecretHandshake.new(1)
    expected = ["wink"]
    assert_equal expected, secret_handshake.commands
  end

  def test_double_blink_for_10
    skip
    secret_handshake = SecretHandshake.new(2)
    expected = ["double blink"]
    assert_equal expected, secret_handshake.commands
  end

  def test_close_your_eyes_for_100
    skip
    secret_handshake = SecretHandshake.new(4)
    expected = ["close your eyes"]
    assert_equal expected, secret_handshake.commands
  end

  def test_jump_for_1000
    skip
    secret_handshake = SecretHandshake.new(8)
    expected = ["jump"]
    assert_equal expected, secret_handshake.commands
  end

  def test_combine_two_actions
    skip
    secret_handshake = SecretHandshake.new(3)
    expected = ["wink", "double blink"]
    assert_equal expected, secret_handshake.commands
  end

  def test_reverse_two_actions
    skip
    secret_handshake = SecretHandshake.new(19)
    expected = ["double blink", "wink"]
    assert_equal expected, secret_handshake.commands
  end

  def test_reversing_one_action_gives_the_same_action
    skip
    secret_handshake = SecretHandshake.new(24)
    expected = ["jump"]
    assert_equal expected, secret_handshake.commands
  end

  def test_reversing_no_actions_still_gives_no_actions
    skip
    secret_handshake = SecretHandshake.new(16)
    expected = []
    assert_equal expected, secret_handshake.commands
  end

  def test_all_possible_actions
    skip
    secret_handshake = SecretHandshake.new(15)
    expected = ["wink", "double blink", "close your eyes", "jump"]
    assert_equal expected, secret_handshake.commands
  end

  def test_reverse_all_possible_actions
    skip
    secret_handshake = SecretHandshake.new(31)
    expected = ["jump", "close your eyes", "double blink", "wink"]
    assert_equal expected, secret_handshake.commands
  end

  def test_do_nothing_for_zero
    skip
    secret_handshake = SecretHandshake.new(0)
    expected = []
    assert_equal expected, secret_handshake.commands
  end
end
