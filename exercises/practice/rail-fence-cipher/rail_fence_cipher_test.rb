require 'minitest/autorun'
require_relative 'rail_fence_cipher'

class RailFenceCipherTest < Minitest::Test
  def test_encode_with_two_rails
    # skip
    assert_equal 'XXXXXXXXXOOOOOOOOO', RailFenceCipher.encode('XOXOXOXOXOXOXOXOXO', 2)
  end

  def test_encode_with_three_rails
    skip
    assert_equal 'WECRLTEERDSOEEFEAOCAIVDEN', RailFenceCipher.encode('WEAREDISCOVEREDFLEEATONCE', 3)
  end

  def test_encode_with_ending_in_the_middle
    skip
    assert_equal 'ESXIEECSR', RailFenceCipher.encode('EXERCISES', 4)
  end

  def test_decode_with_three_rails
    skip
    assert_equal 'THEDEVILISINTHEDETAILS', RailFenceCipher.decode('TEITELHDVLSNHDTISEIIEA', 3)
  end

  def test_decode_with_five_rails
    skip
    assert_equal 'EXERCISMISAWESOME', RailFenceCipher.decode('EIEXMSMESAORIWSCE', 5)
  end

  def test_decode_with_six_rails
    skip
    assert_equal '112358132134558914423337761098715972584418167651094617711286', RailFenceCipher.decode('133714114238148966225439541018335470986172518171757571896261', 6)
  end
end
