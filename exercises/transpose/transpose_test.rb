require 'minitest/autorun'
require_relative 'transpose'

# Common test data version: 1.1.0 92bc877
class TransposeTest < Minitest::Test
  def test_empty_string
    # skip
    input = <<~INPUT.strip

    INPUT

    expected = <<~EXPECTED.strip

    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_row
    skip
    input = <<~INPUT.strip
      A1
    INPUT

    expected = <<~EXPECTED.strip
      A
      1
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_two_characters_in_a_column
    skip
    input = <<~INPUT.strip
      A
      1
    INPUT

    expected = <<~EXPECTED.strip
      A1
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_simple
    skip
    input = <<~INPUT.strip
      ABC
      123
    INPUT

    expected = <<~EXPECTED.strip
      A1
      B2
      C3
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_single_line
    skip
    input = <<~INPUT.strip
      Single line.
    INPUT

    expected = <<~EXPECTED.strip
      S
      i
      n
      g
      l
      e
       
      l
      i
      n
      e
      .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_first_line_longer_than_second_line
    skip
    input = <<~INPUT.strip
      The fourth line.
      The fifth line.
    INPUT

    expected = <<~EXPECTED.strip
      TT
      hh
      ee
        
      ff
      oi
      uf
      rt
      th
      h 
       l
      li
      in
      ne
      e.
      .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_second_line_longer_than_first_line
    skip
    input = <<~INPUT.strip
      The first line.
      The second line.
    INPUT

    expected = <<~EXPECTED.strip
      TT
      hh
      ee
        
      fs
      ie
      rc
      so
      tn
       d
      l 
      il
      ni
      en
      .e
       .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_mixed_line_length
    skip
    input = <<~INPUT.strip
      The longest line.
      A long line.
      A longer line.
      A line.
    INPUT

    expected = <<~EXPECTED.strip
      TAAA
      h   
      elll
       ooi
      lnnn
      ogge
      n e.
      glr
      ei 
      snl
      tei
       .n
      l e
      i .
      n
      e
      .
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_square
    skip
    input = <<~INPUT.strip
      HEART
      EMBER
      ABUSE
      RESIN
      TREND
    INPUT

    expected = <<~EXPECTED.strip
      HEART
      EMBER
      ABUSE
      RESIN
      TREND
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_rectangle
    skip
    input = <<~INPUT.strip
      FRACTURE
      OUTLINED
      BLOOMING
      SEPTETTE
    INPUT

    expected = <<~EXPECTED.strip
      FOBS
      RULE
      ATOP
      CLOT
      TIME
      UNIT
      RENT
      EDGE
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end

  def test_triangle
    skip
    input = <<~INPUT.strip
      T
      EE
      AAA
      SSSS
      EEEEE
      RRRRRR
    INPUT

    expected = <<~EXPECTED.strip
      TEASER
       EASER
        ASER
         SER
          ER
           R
    EXPECTED

    assert_equal expected, Transpose.transpose(input)
  end
end
