require 'minitest/autorun'
require_relative 'run_length_encoding'

class RunLengthEncodingTest < Minitest::Test
  def test_run_length_encode_a_string_empty_string
    # skip
    input = ""
    output = ""
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_run_length_encode_a_string_single_characters_only_are_encoded_without_count
    skip
    input = "XYZ"
    output = "XYZ"
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_run_length_encode_a_string_string_with_no_single_characters
    skip
    input = "AABBBCCCC"
    output = "2A3B4C"
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_run_length_encode_a_string_single_characters_mixed_with_repeated_characters
    skip
    input = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    output = "12WB12W3B24WB"
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_run_length_encode_a_string_multiple_whitespace_mixed_in_string
    skip
    input = "  hsqq qww  "
    output = "2 hs2q q2w2 "
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_run_length_encode_a_string_lowercase_characters
    skip
    input = "aabbbcccc"
    output = "2a3b4c"
    assert_equal output, RunLengthEncoding.encode(input)
  end

  def test_run_length_decode_a_string_empty_string
    skip
    input = ""
    output = ""
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_run_length_decode_a_string_single_characters_only
    skip
    input = "XYZ"
    output = "XYZ"
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_run_length_decode_a_string_string_with_no_single_characters
    skip
    input = "2A3B4C"
    output = "AABBBCCCC"
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_run_length_decode_a_string_single_characters_with_repeated_characters
    skip
    input = "12WB12W3B24WB"
    output = "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_run_length_decode_a_string_multiple_whitespace_mixed_in_string
    skip
    input = "2 hs2q q2w2 "
    output = "  hsqq qww  "
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_run_length_decode_a_string_lowercase_string
    skip
    input = "2a3b4c"
    output = "aabbbcccc"
    assert_equal output, RunLengthEncoding.decode(input)
  end

  def test_encode_and_then_decode_encode_followed_by_decode_gives_original_string
    skip
    input = "zzz ZZ  zZ"
    encoded = RunLengthEncoding.encode(input)
    decoded = RunLengthEncoding.decode(encoded)
    assert_equal input, decoded
  end
end
