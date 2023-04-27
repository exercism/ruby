require 'minitest/autorun'
require_relative 'pig_latin'

class PigLatinTest < Minitest::Test
  def test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_a
    # skip
    assert_equal "appleay", PigLatin.translate("apple")
  end

  def test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_e
    skip
    assert_equal "earay", PigLatin.translate("ear")
  end

  def test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_i
    skip
    assert_equal "iglooay", PigLatin.translate("igloo")
  end

  def test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_o
    skip
    assert_equal "objectay", PigLatin.translate("object")
  end

  def test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_u
    skip
    assert_equal "underay", PigLatin.translate("under")
  end

  def test_ay_is_added_to_words_that_start_with_vowels_word_beginning_with_a_vowel_and_followed_by_a_qu
    skip
    assert_equal "equalay", PigLatin.translate("equal")
  end

  def test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_p
    skip
    assert_equal "igpay", PigLatin.translate("pig")
  end

  def test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_k
    skip
    assert_equal "oalakay", PigLatin.translate("koala")
  end

  def test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_x
    skip
    assert_equal "enonxay", PigLatin.translate("xenon")
  end

  def test_first_letter_and_ay_are_moved_to_the_end_of_words_that_start_with_consonants_word_beginning_with_q_without_a_following_u
    skip
    assert_equal "atqay", PigLatin.translate("qat")
  end

  def test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_ch
    skip
    assert_equal "airchay", PigLatin.translate("chair")
  end

  def test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_qu
    skip
    assert_equal "eenquay", PigLatin.translate("queen")
  end

  def test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_qu_and_a_preceding_consonant
    skip
    assert_equal "aresquay", PigLatin.translate("square")
  end

  def test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_th
    skip
    assert_equal "erapythay", PigLatin.translate("therapy")
  end

  def test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_thr
    skip
    assert_equal "ushthray", PigLatin.translate("thrush")
  end

  def test_some_letter_clusters_are_treated_like_a_single_consonant_word_beginning_with_sch
    skip
    assert_equal "oolschay", PigLatin.translate("school")
  end

  def test_some_letter_clusters_are_treated_like_a_single_vowel_word_beginning_with_yt
    skip
    assert_equal "yttriaay", PigLatin.translate("yttria")
  end

  def test_some_letter_clusters_are_treated_like_a_single_vowel_word_beginning_with_xr
    skip
    assert_equal "xrayay", PigLatin.translate("xray")
  end

  def test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel_y_is_treated_like_a_consonant_at_the_beginning_of_a_word
    skip
    assert_equal "ellowyay", PigLatin.translate("yellow")
  end

  def test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel_y_is_treated_like_a_vowel_at_the_end_of_a_consonant_cluster
    skip
    assert_equal "ythmrhay", PigLatin.translate("rhythm")
  end

  def test_position_of_y_in_a_word_determines_if_it_is_a_consonant_or_a_vowel_y_as_second_letter_in_two_letter_word
    skip
    assert_equal "ymay", PigLatin.translate("my")
  end

  def test_phrases_are_translated_a_whole_phrase
    skip
    assert_equal "ickquay astfay unray", PigLatin.translate("quick fast run")
  end
end
