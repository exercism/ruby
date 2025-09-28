require 'minitest/autorun'
require_relative 'pig_latin'

class PigLatinTest < Minitest::Test
  def test_word_beginning_with_a
    # skip
    actual = PigLatin.translate('apple')
    expected = 'appleay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_e
    skip
    actual = PigLatin.translate('ear')
    expected = 'earay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_i
    skip
    actual = PigLatin.translate('igloo')
    expected = 'iglooay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_o
    skip
    actual = PigLatin.translate('object')
    expected = 'objectay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_u
    skip
    actual = PigLatin.translate('under')
    expected = 'underay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_a_vowel_and_followed_by_a_qu
    skip
    actual = PigLatin.translate('equal')
    expected = 'equalay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_p
    skip
    actual = PigLatin.translate('pig')
    expected = 'igpay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_k
    skip
    actual = PigLatin.translate('koala')
    expected = 'oalakay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_x
    skip
    actual = PigLatin.translate('xenon')
    expected = 'enonxay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_q_without_a_following_u
    skip
    actual = PigLatin.translate('qat')
    expected = 'atqay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_consonant_and_vowel_containing_qu
    skip
    actual = PigLatin.translate('liquid')
    expected = 'iquidlay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_ch
    skip
    actual = PigLatin.translate('chair')
    expected = 'airchay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_qu
    skip
    actual = PigLatin.translate('queen')
    expected = 'eenquay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_qu_and_a_preceding_consonant
    skip
    actual = PigLatin.translate('square')
    expected = 'aresquay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_th
    skip
    actual = PigLatin.translate('therapy')
    expected = 'erapythay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_thr
    skip
    actual = PigLatin.translate('thrush')
    expected = 'ushthray'
    assert_equal expected, actual
  end

  def test_word_beginning_with_sch
    skip
    actual = PigLatin.translate('school')
    expected = 'oolschay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_yt
    skip
    actual = PigLatin.translate('yttria')
    expected = 'yttriaay'
    assert_equal expected, actual
  end

  def test_word_beginning_with_xr
    skip
    actual = PigLatin.translate('xray')
    expected = 'xrayay'
    assert_equal expected, actual
  end

  def test_y_is_treated_like_a_consonant_at_the_beginning_of_a_word
    skip
    actual = PigLatin.translate('yellow')
    expected = 'ellowyay'
    assert_equal expected, actual
  end

  def test_y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster
    skip
    actual = PigLatin.translate('rhythm')
    expected = 'ythmrhay'
    assert_equal expected, actual
  end

  def test_y_as_second_letter_in_two_letter_word
    skip
    actual = PigLatin.translate('my')
    expected = 'ymay'
    assert_equal expected, actual
  end

  def test_a_whole_phrase
    skip
    actual = PigLatin.translate('quick fast run')
    expected = 'ickquay astfay unray'
    assert_equal expected, actual
  end
end
