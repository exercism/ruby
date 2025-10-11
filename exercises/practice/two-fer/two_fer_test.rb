require 'minitest/autorun'
require_relative 'two_fer'

class TwoFerTest < Minitest::Test
  def test_no_name_given
    # skip
    actual = TwoFer.two_fer
    expected = 'One for you, one for me.'
    assert_equal expected, actual
  end

  def test_a_name_given
    skip
    actual = TwoFer.two_fer('Alice')
    expected = 'One for Alice, one for me.'
    assert_equal expected, actual
  end

  def test_another_name_given
    skip
    actual = TwoFer.two_fer('Bob')
    expected = 'One for Bob, one for me.'
    assert_equal expected, actual
  end
end
