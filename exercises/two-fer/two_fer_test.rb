require 'minitest/autorun'
require_relative 'two_fer'

# Common test data version: 1.1.0 c080bdf
class TwoFerTest < Minitest::Test
  def test_no_name_given
    # skip
    assert_equal "One for you, one for me.", TwoFer.getResponse('')
  end

  def test_a_name_given
    skip
    assert_equal "One for Alice, one for me.", TwoFer.getResponse('Alice')
  end

  def test_another_name_given
    skip
    assert_equal "One for Bob, one for me.", TwoFer.getResponse('Bob')
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
