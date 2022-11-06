require 'minitest/autorun'
require_relative 'transpose'

class TransposeTest < Minitest::Test
  def test_empty_string
    # skip
    input = ""
    expected = ""
    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_row
    skip
    input = "A1"
    expected = "A\n1"
    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_column
    skip
    input = "A\n1"
    expected = "A1"
    assert_equal expected, Transpose.transpose(input)
  end

  def test_simple
    skip
    input = "ABC\n123"
    expected = "A1\nB2\nC3"
    assert_equal expected, Transpose.transpose(input)
  end

  def test_single_line
    skip
    input = "Single line."
    expected = "S\ni\nn\ng\nl\ne\n \nl\ni\nn\ne\n."
    assert_equal expected, Transpose.transpose(input)
  end

  def test_first_line_longer_than_second_line
    skip
    input = "The fourth line.\nThe fifth line."
    expected = "TT\nhh\nee\n  \nff\noi\nuf\nrt\nth\nh \n l\nli\nin\nne\ne.\n."
    assert_equal expected, Transpose.transpose(input)
  end

  def test_second_line_longer_than_first_line
    skip
    input = "The first line.\nThe second line."
    expected = "TT\nhh\nee\n  \nfs\nie\nrc\nso\ntn\n d\nl \nil\nni\nen\n.e\n ."
    assert_equal expected, Transpose.transpose(input)
  end

  def test_mixed_line_length
    skip
    input = "The longest line.\nA long line.\nA longer line.\nA line."
    expected = "TAAA\nh   \nelll\n ooi\nlnnn\nogge\nn e.\nglr\nei \nsnl\ntei\n .n\nl e\ni .\nn\ne\n."
    assert_equal expected, Transpose.transpose(input)
  end

  def test_square
    skip
    input = "HEART\nEMBER\nABUSE\nRESIN\nTREND"
    expected = "HEART\nEMBER\nABUSE\nRESIN\nTREND"
    assert_equal expected, Transpose.transpose(input)
  end

  def test_rectangle
    skip
    input = "FRACTURE\nOUTLINED\nBLOOMING\nSEPTETTE"
    expected = "FOBS\nRULE\nATOP\nCLOT\nTIME\nUNIT\nRENT\nEDGE"
    assert_equal expected, Transpose.transpose(input)
  end

  def test_triangle
    skip
    input = "T\nEE\nAAA\nSSSS\nEEEEE\nRRRRRR"
    expected = "TEASER\n EASER\n  ASER\n   SER\n    ER\n     R"
    assert_equal expected, Transpose.transpose(input)
  end

  def test_jagged_triangle
    skip
    input = "11\n2\n3333\n444\n555555\n66666"
    expected = "123456\n1 3456\n  3456\n  3 56\n    56\n    5"
    assert_equal expected, Transpose.transpose(input)
  end
end
