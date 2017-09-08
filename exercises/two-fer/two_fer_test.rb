require 'minitest/autorun'
require_relative 'two_fer'

class TwoFerTest < Minitest::Test
  def test_no_name_given
    assert_equal TwoFer.getResponse(""), "One for you, one for me."
  end

  def test_name_given
    assert_equal TwoFer.getResponse("Alice"), "One for Alice, one for me."
  end

  def test_another_name_given
    assert_equal TwoFer.getResponse("Bob"), "One for Bob, one for me."
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module.
  #  In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    assert_equal 1, BookKeeping::VERSION
  end

end
