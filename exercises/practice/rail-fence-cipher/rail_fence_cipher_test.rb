require 'minitest/autorun'
require_relative 'rail_fence_cipher'

class RailFenceCipherTest < Minitest::Test
  def test_encode_encode_with_two_rails
    # skip
    message = "XOXOXOXOXOXOXOXOXO"
    expected = "XXXXXXXXXOOOOOOOOO"
    assert_equal expected, RailFenceCipher.encode(message, 2)
  end

  def test_encode_encode_with_three_rails
    skip
    message = "WEAREDISCOVEREDFLEEATONCE"
    expected = "WECRLTEERDSOEEFEAOCAIVDEN"
    assert_equal expected, RailFenceCipher.encode(message, 3)
  end

  def test_encode_encode_with_ending_in_the_middle
    skip
    message = "EXERCISES"
    expected = "ESXIEECSR"
    assert_equal expected, RailFenceCipher.encode(message, 4)
  end

  def test_decode_decode_with_three_rails
    skip
    message = "TEITELHDVLSNHDTISEIIEA"
    expected = "THEDEVILISINTHEDETAILS"
    assert_equal expected, RailFenceCipher.decode(message, 3)
  end

  def test_decode_decode_with_five_rails
    skip
    message = "EIEXMSMESAORIWSCE"
    expected = "EXERCISMISAWESOME"
    assert_equal expected, RailFenceCipher.decode(message, 5)
  end

  def test_decode_decode_with_six_rails
    skip
    message = "133714114238148966225439541018335470986172518171757571896261"
    expected = "112358132134558914423337761098715972584418167651094617711286"
    assert_equal expected, RailFenceCipher.decode(message, 6)
  end
end
