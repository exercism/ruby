#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'transpose'

# Common test data version: 6dba022
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

  def test_many_lines
    skip
    input = <<-INPUT.gsub(/^ {6}/, '')
      Chor. Two households, both alike in dignity,
      In fair Verona, where we lay our scene,
      From ancient grudge break to new mutiny,
      Where civil blood makes civil hands unclean.
      From forth the fatal loins of these two foes
      A pair of star-cross'd lovers take their life;
      Whose misadventur'd piteous overthrows
      Doth with their death bury their parents' strife.
      The fearful passage of their death-mark'd love,
      And the continuance of their parents' rage,
      Which, but their children's end, naught could remove,
      Is now the two hours' traffic of our stage;
      The which if you with patient ears attend,
      What here shall miss, our toil shall strive to mend.
INPUT
    actual = Transpose.transpose(input)
    expected = <<-EXPECTED.gsub(/^ {6}/, '')
      CIFWFAWDTAWITW
      hnrhr hohnhshh
      o oeopotedi ea
      rfmrmash  cn t
      .a e ie fthow 
       ia fr weh,whh
      Trnco miae  ie
      w ciroitr btcr
      oVivtfshfcuhhe
       eeih a uote  
      hrnl sdtln  is
      oot ttvh tttfh
      un bhaeepihw a
      saglernianeoyl
      e,ro -trsui ol
      h uofcu sarhu 
      owddarrdan o m
      lhg to'egccuwi
      deemasdaeehris
      sr als t  ists
      ,ebk 'phool'h,
        reldi ffd   
      bweso tb  rtpo
      oea ileutterau
      t kcnoorhhnatr
      hl isvuyee'fi 
       atv es iisfet
      ayoior trr ino
      l  lfsoh  ecti
      ion   vedpn  l
      kuehtteieadoe 
      erwaharrar,fas
         nekt te  rh
      ismdsehphnnosa
      ncuse ra-tau l
       et  tormsural
      dniuthwea'g t 
      iennwesnr hsts
      g,ycoi tkrttet
      n ,l r s'a anr
      i  ef  'dgcgdi
      t  aol   eoe,v
      y  nei sl,u; e
      ,  .sf to l   
           e rv d  t
           ; ie    o
             f, r   
             e  e  m
             .  m  e
                o  n
                v  d
                e  .
                ,
EXPECTED
    assert_equal expected.strip, actual
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html

  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end
end
