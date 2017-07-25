require 'minitest/autorun'
require_relative 'rotational_cipher'

# Common test data version: 1.1.0 9c658d1
class RotationalCipherTest < Minitest::Test
  def test_rotate_a_by_0_same_output_as_input
    # skip
    assert_equal "a", RotationalCipher.rotate("a", 0)
  end

  def test_rotate_a_by_1
    skip
    assert_equal "b", RotationalCipher.rotate("a", 1)
  end

  def test_rotate_a_by_26_same_output_as_input
    skip
    assert_equal "a", RotationalCipher.rotate("a", 26)
  end

  def test_rotate_m_by_13
    skip
    assert_equal "z", RotationalCipher.rotate("m", 13)
  end

  def test_rotate_n_by_13_with_wrap_around_alphabet
    skip
    assert_equal "a", RotationalCipher.rotate("n", 13)
  end

  def test_rotate_capital_letters
    skip
    assert_equal "TRL", RotationalCipher.rotate("OMG", 5)
  end

  def test_rotate_spaces
    skip
    assert_equal "T R L", RotationalCipher.rotate("O M G", 5)
  end

  def test_rotate_numbers
    skip
    assert_equal "Xiwxmrk 1 2 3 xiwxmrk", RotationalCipher.rotate("Testing 1 2 3 testing", 4)
  end

  def test_rotate_punctuation
    skip
    assert_equal "Gzo'n zvo, Bmviyhv!", RotationalCipher.rotate("Let's eat, Grandma!", 21)
  end

  def test_rotate_all_letters
    skip
    assert_equal "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.", RotationalCipher.rotate("The quick brown fox jumps over the lazy dog.", 13)
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
