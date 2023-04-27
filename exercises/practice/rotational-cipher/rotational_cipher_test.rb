require 'minitest/autorun'
require_relative 'rotational_cipher'

class RotationalCipherTest < Minitest::Test
  def test_rotate_a_by_0_same_output_as_input
    # skip
    text = "a"
    assert_equal "a", RotationalCipher.rotate(text, 0)
  end

  def test_rotate_a_by_1
    skip
    text = "a"
    assert_equal "b", RotationalCipher.rotate(text, 1)
  end

  def test_rotate_a_by_26_same_output_as_input
    skip
    text = "a"
    assert_equal "a", RotationalCipher.rotate(text, 26)
  end

  def test_rotate_m_by_13
    skip
    text = "m"
    assert_equal "z", RotationalCipher.rotate(text, 13)
  end

  def test_rotate_n_by_13_with_wrap_around_alphabet
    skip
    text = "n"
    assert_equal "a", RotationalCipher.rotate(text, 13)
  end

  def test_rotate_capital_letters
    skip
    text = "OMG"
    assert_equal "TRL", RotationalCipher.rotate(text, 5)
  end

  def test_rotate_spaces
    skip
    text = "O M G"
    assert_equal "T R L", RotationalCipher.rotate(text, 5)
  end

  def test_rotate_numbers
    skip
    text = "Testing 1 2 3 testing"
    assert_equal "Xiwxmrk 1 2 3 xiwxmrk", RotationalCipher.rotate(text, 4)
  end

  def test_rotate_punctuation
    skip
    text = "Let's eat, Grandma!"
    assert_equal "Gzo'n zvo, Bmviyhv!", RotationalCipher.rotate(text, 21)
  end

  def test_rotate_all_letters
    skip
    text = "The quick brown fox jumps over the lazy dog."
    assert_equal "Gur dhvpx oebja sbk whzcf bire gur ynml qbt.", RotationalCipher.rotate(text, 13)
  end
end
