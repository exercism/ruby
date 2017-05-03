#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative 'pig_latin'

# Common test data version: 1.0.0 d4e9a22
class PigLatinTest < Minitest::Test
  def test_word_beginning_with_a
    # skip
    assert_equal "appleay", PigLatin.translate("apple")
  end

  def test_word_beginning_with_e
    skip
    assert_equal "earay", PigLatin.translate("ear")
  end

  def test_word_beginning_with_i
    skip
    assert_equal "iglooay", PigLatin.translate("igloo")
  end

  def test_word_beginning_with_o
    skip
    assert_equal "objectay", PigLatin.translate("object")
  end

  def test_word_beginning_with_u
    skip
    assert_equal "underay", PigLatin.translate("under")
  end

  def test_word_beginning_with_a_vowel_and_followed_by_a_qu
    skip
    assert_equal "equalay", PigLatin.translate("equal")
  end

  def test_word_beginning_with_p
    skip
    assert_equal "igpay", PigLatin.translate("pig")
  end

  def test_word_beginning_with_k
    skip
    assert_equal "oalakay", PigLatin.translate("koala")
  end

  def test_word_beginning_with_y
    skip
    assert_equal "ellowyay", PigLatin.translate("yellow")
  end

  def test_word_beginning_with_x
    skip
    assert_equal "enonxay", PigLatin.translate("xenon")
  end

  def test_word_beginning_with_q_without_a_following_u
    skip
    assert_equal "atqay", PigLatin.translate("qat")
  end

  def test_word_beginning_with_ch
    skip
    assert_equal "airchay", PigLatin.translate("chair")
  end

  def test_word_beginning_with_qu
    skip
    assert_equal "eenquay", PigLatin.translate("queen")
  end

  def test_word_beginning_with_qu_and_a_preceding_consonant
    skip
    assert_equal "aresquay", PigLatin.translate("square")
  end

  def test_word_beginning_with_th
    skip
    assert_equal "erapythay", PigLatin.translate("therapy")
  end

  def test_word_beginning_with_thr
    skip
    assert_equal "ushthray", PigLatin.translate("thrush")
  end

  def test_word_beginning_with_sch
    skip
    assert_equal "oolschay", PigLatin.translate("school")
  end

  def test_word_beginning_with_yt
    skip
    assert_equal "yttriaay", PigLatin.translate("yttria")
  end

  def test_word_beginning_with_xr
    skip
    assert_equal "xrayay", PigLatin.translate("xray")
  end

  def test_a_whole_phrase
    skip
    assert_equal "ickquay astfay unray", PigLatin.translate("quick fast run")
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
