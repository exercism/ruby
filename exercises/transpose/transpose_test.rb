require 'minitest/autorun'
require_relative 'transpose'

# Common test data version: 1.1.0 92bc877
class TransposeTest < Minitest::Test
  def test_empty_string
    # skip
    input = <<-INPUT.gsub(/^ {6}/, '')

INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')

EXPECTED
    assert_equal expected.strip, actual
  end

  def test_two_characters_in_a_row
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      A1
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      A
      1
EXPECTED
    assert_equal expected.strip, actual
  end

  def test_two_characters_in_a_column
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      A
      1
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      A1
EXPECTED
    assert_equal expected.strip, actual
  end

  def test_simple
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      ABC
      123
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      A1
      B2
      C3
EXPECTED
    assert_equal expected.strip, actual
  end

  def test_single_line
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      Single line.
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
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
    assert_equal expected.strip, actual
  end

  def test_first_line_longer_than_second_line
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      The fourth line.
      The fifth line.
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
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
    assert_equal expected.strip, actual
  end

  def test_second_line_longer_than_first_line
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      The first line.
      The second line.
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
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
    assert_equal expected.strip, actual
  end

  def test_mixed_line_length
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      The longest line.
      A long line.
      A longer line.
      A line.
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
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
    assert_equal expected.strip, actual
  end

  def test_square
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      HEART
      EMBER
      ABUSE
      RESIN
      TREND
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      HEART
      EMBER
      ABUSE
      RESIN
      TREND
EXPECTED
    assert_equal expected.strip, actual
  end

  def test_rectangle
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      FRACTURE
      OUTLINED
      BLOOMING
      SEPTETTE
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      FOBS
      RULE
      ATOP
      CLOT
      TIME
      UNIT
      RENT
      EDGE
EXPECTED
    assert_equal expected.strip, actual
  end

  def test_triangle
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      T
      EE
      AAA
      SSSS
      EEEEE
      RRRRRR
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      TEASER
       EASER
        ASER
         SER
          ER
           R
EXPECTED
    assert_equal expected.strip, actual
  end

end
