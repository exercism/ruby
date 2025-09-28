require 'minitest/autorun'
require_relative 'rail_fence_cipher'

class RailFenceCipherTest < Minitest::Test
  def test_encode_with_two_rails
    # skip
    actual = RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)
    expected = 'XXXXXXXXXOOOOOOOOO'
    assert_equal expected, actual
  end

  def test_encode_with_three_rails
    skip
    actual = RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3)
    expected = 'WECRLTEERDSOEEFEAOCAIVDEN'
    assert_equal expected, actual
  end

  def test_encode_with_ending_in_the_middle
    skip
    actual = RailFenceCipher.encode('EXERCISES', 4)
    expected = 'ESXIEECSR'
    assert_equal expected, actual
  end

  def test_decode_with_three_rails
    skip
    actual = RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)
    expected = 'THEDEVILISINTHEDETAILS'
    assert_equal expected, actual
  end

  def test_decode_with_five_rails
    skip
    actual = RailFenceCipher.decode('EIEXMSMESAORIWSCE', 5)
    expected = 'EXERCISMISAWESOME'
    assert_equal expected, actual
  end

  def test_decode_with_six_rails
    skip
    actual = RailFenceCipher.decode('133714114238148966225439541018335470986172518171757571896261', 6)
    expected = '112358132134558914423337761098715972584418167651094617711286'
    assert_equal expected, actual
  end
end
