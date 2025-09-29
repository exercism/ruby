require 'minitest/autorun'
require_relative 'run_length_encoding'

class RunLengthEncodingTest < Minitest::Test
  def test_encode_empty_string
    # skip
    actual = RunLengthEncoding.encode('')
    expected = ''
    assert_equal expected, actual
  end

  def test_encode_single_characters_only_are_encoded_without_count
    skip
    actual = RunLengthEncoding.encode('XYZ')
    expected = 'XYZ'
    assert_equal expected, actual
  end

  def test_encode_string_with_no_single_characters
    skip
    actual = RunLengthEncoding.encode('AABBBCCCC')
    expected = '2A3B4C'
    assert_equal expected, actual
  end

  def test_encode_single_characters_mixed_with_repeated_characters
    skip
    actual = RunLengthEncoding.encode('WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB')
    expected = '12WB12W3B24WB'
    assert_equal expected, actual
  end

  def test_encode_multiple_whitespace_mixed_in_string
    skip
    actual = RunLengthEncoding.encode('  hsqq qww  ')
    expected = '2 hs2q q2w2 '
    assert_equal expected, actual
  end

  def test_encode_lowercase_characters
    skip
    actual = RunLengthEncoding.encode('aabbbcccc')
    expected = '2a3b4c'
    assert_equal expected, actual
  end

  def test_decode_empty_string
    skip
    actual = RunLengthEncoding.decode('')
    expected = ''
    assert_equal expected, actual
  end

  def test_decode_single_characters_only
    skip
    actual = RunLengthEncoding.decode('XYZ')
    expected = 'XYZ'
    assert_equal expected, actual
  end

  def test_decode_string_with_no_single_characters
    skip
    actual = RunLengthEncoding.decode('2A3B4C')
    expected = 'AABBBCCCC'
    assert_equal expected, actual
  end

  def test_decode_single_characters_with_repeated_characters
    skip
    actual = RunLengthEncoding.decode('12WB12W3B24WB')
    expected = 'WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB'
    assert_equal expected, actual
  end

  def test_decode_multiple_whitespace_mixed_in_string
    skip
    actual = RunLengthEncoding.decode('2 hs2q q2w2 ')
    expected = '  hsqq qww  '
    assert_equal expected, actual
  end

  def test_decode_lowercase_string
    skip
    actual = RunLengthEncoding.decode('2a3b4c')
    expected = 'aabbbcccc'
    assert_equal expected, actual
  end

  def test_consistency_encode_followed_by_decode_gives_original_string
    skip
    actual = RunLengthEncoding.decode(RunLengthEncoding.encode('zzz ZZ  zZ'))
    expected = 'zzz ZZ  zZ'
    assert_equal expected, actual
  end
end
