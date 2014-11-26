require 'minitest/autorun'
require_relative 'crypto'

class CryptoTest < MiniTest::Unit::TestCase
  def test_normalize_strange_characters
    crypto = Crypto.new('s#$%^&plunk')
    assert_equal "splunk", crypto.normalize_plaintext
  end

  def test_normalize_uppercase_characters
    skip
    crypto = Crypto.new('WHOA HEY!')
    assert_equal "whoahey", crypto.normalize_plaintext
  end

  def test_normalize_with_numbers
    skip
    crypto = Crypto.new('1, 2, 3 GO!')
    assert_equal "123go", crypto.normalize_plaintext
  end

  def test_size_of_small_square
    skip
    crypto = Crypto.new('1234')
    assert_equal 2, crypto.size
  end

  def test_size_of_slightly_larger_square
    skip
    crypto = Crypto.new('123456789')
    assert_equal 3, crypto.size
  end

  def test_size_of_non_perfect_square
    skip
    crypto = Crypto.new('123456789abc')
    assert_equal 4, crypto.size
  end

  def test_size_is_determined_by_normalized_plaintext
    skip
    crypto = Crypto.new('Oh hey, this is nuts!')
    assert_equal 4, crypto.size
  end

  def test_plaintext_segments
    skip
    crypto = Crypto.new('Never vex thine heart with idle woes')
    assert_equal ["neverv", "exthin", "eheart", "withid", "lewoes"], crypto.plaintext_segments
  end

  def test_other_plaintext_segments
    skip
    crypto = Crypto.new('ZOMG! ZOMBIES!!!')
    assert_equal ["zomg", "zomb", "ies"], crypto.plaintext_segments
  end

  def test_ciphertext
    skip
    crypto = Crypto.new('Time is an illusion. Lunchtime doubly so.')
    assert_equal "tasneyinicdsmiohooelntuillibsuuml", crypto.ciphertext
  end

  def test_another_ciphertext
    skip
    crypto = Crypto.new('We all know interspecies romance is weird.')
    assert_equal "wneiaweoreneawssciliprerlneoidktcms", crypto.ciphertext
  end

  def test_normalized_ciphertext
    skip
    crypto = Crypto.new('Vampires are people too!')
    assert_equal 'vrel aepe mset paoo irpo', crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_spills_into_short_segment
    skip
    crypto = Crypto.new('Madness, and then illumination.')
    assert_equal 'msemo aanin dninn dlaet ltshu i', crypto.normalize_ciphertext
  end

  def test_another_normalized_ciphertext
    skip
    crypto = Crypto.new('If man was meant to stay on the ground god would have given us roots')
    assert_equal 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghns seoau', crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_with_punctuation
    skip
    crypto = Crypto.new('Have a nice day. Feed the dog & chill out!')
    assert_equal 'hifei acedl veeol eddgo aatcu nyhht', crypto.normalize_ciphertext
  end

  def test_normalized_ciphertext_when_just_less_then_a_full_square
    skip
    crypto = Crypto.new('I am')
    assert_equal 'im a', crypto.normalize_ciphertext
  end
end
