require 'minitest/autorun'
require_relative 'rotational_cipher'

class RotationalCipherTest < Minitest::Test
  def test_rotate_a_by_0_same_output_as_input
    # skip
    actual = RotationalCipher.rotate("a", 0)
    expected = "a"
    assert_equal expected, actual
  end

  def test_rotate_a_by_1
    skip
    actual = RotationalCipher.rotate("a", 1)
    expected = "b"
    assert_equal expected, actual
  end

  def test_rotate_a_by_26_same_output_as_input
    skip
    actual = RotationalCipher.rotate("a", 26)
    expected = "a"
    assert_equal expected, actual
  end

  def test_rotate_m_by_13
    skip
    actual = RotationalCipher.rotate("m", 13)
    expected = "z"
    assert_equal expected, actual
  end

  def test_rotate_n_by_13_with_wrap_around_alphabet
    skip
    actual = RotationalCipher.rotate("n", 13)
    expected = "a"
    assert_equal expected, actual
  end

  def test_rotate_capital_letters
    skip
    actual = RotationalCipher.rotate("OMG", 5)
    expected = "TRL"
    assert_equal expected, actual
  end

  def test_rotate_spaces
    skip
    actual = RotationalCipher.rotate("O M G", 5)
    expected = "T R L"
    assert_equal expected, actual
  end

  def test_rotate_numbers
    skip
    actual = RotationalCipher.rotate("Testing 1 2 3 testing", 4)
    expected = "Xiwxmrk 1 2 3 xiwxmrk"
    assert_equal expected, actual
  end

  def test_rotate_punctuation
    skip
    actual = RotationalCipher.rotate("Let's eat, Grandma!", 21)
    expected = "Gzo'n zvo, Bmviyhv!"
    assert_equal expected, actual
  end

  def test_rotate_all_letters
    skip
    actual = RotationalCipher.rotate("The quick brown fox jumps over the lazy dog.", 13)
    expected = "Gur dhvpx oebja sbk whzcf bire gur ynml qbt."
    assert_equal expected, actual
  end
end
