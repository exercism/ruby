require 'minitest/autorun'
require_relative 'two_fer'

class TwoFerTest < Minitest::Test
  def  test_empty
    #skip
    assert_equal "One for you, one for me.", TwoFer.two_fer
  end

  def test_alice
    skip
    assert_equal "One for Alice, one for me.", TwoFer.two_fer("Alice")
  end

  def test_bob
    skip
    assert_equal "One for Bob, one for me.", TwoFer.two_fer("Bob")
  end
end
