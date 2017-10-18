require 'minitest/autorun'
# require_relative 'two_fer'
require_relative '.meta/solutions/two_fer'

class TwoFerTest < Minitest::Test
  def test_empty_name_as_argument
    result = TwoFer.say
    assert_equal result, 'One for you, one for me.'
  end

  def test_alice_as_argument
    result = TwoFer.say('Alice')
    assert_equal result, 'One for Alice, one for me.'
  end

  def test_bob_as_argument
    result = TwoFer.say('Bob')
    assert_equal result, 'One for Bob, one for me.'
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
