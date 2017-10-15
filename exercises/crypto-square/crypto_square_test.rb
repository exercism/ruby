require 'minitest/autorun'
require_relative 'crypto_square'

# Common test data version: 2.0.0 bcdd704
class CryptoSquareTest < Minitest::Test
  def test_lowercase
    # skip
    crypto = Crypto.new('Hello')
    assert_equal "hello", crypto.normalize_plaintext
  end

  def test_remove_spaces
    skip
    crypto = Crypto.new('Hi there')
    assert_equal "hithere", crypto.normalize_plaintext
  end

  def test_remove_punctuation
    skip
    crypto = Crypto.new('@1, 2%, 3 Go!')
    assert_equal "123go", crypto.normalize_plaintext
  end

  def test_empty_plaintext_results_in_an_empty_rectangle
    skip
    crypto = Crypto.new('')
    assert_equal [], crypto.plaintext_segments
  end

  def test_4_character_plaintext_results_in_an_2x2_rectangle
    skip
    crypto = Crypto.new('Ab Cd')
    assert_equal ["ab", "cd"], crypto.plaintext_segments
  end

  def test_9_character_plaintext_results_in_an_3x3_rectangle
    skip
    crypto = Crypto.new('This is fun!')
    assert_equal ["thi", "sis", "fun"], crypto.plaintext_segments
  end

  def test_54_character_plaintext_results_in_an_8x7_rectangle
    skip
    crypto = Crypto.new('If man was meant to stay on the ground, god would have given us roots.')
    assert_equal ["ifmanwas", "meanttos", "tayonthe", "groundgo", "dwouldha", "vegivenu", "sroots"], crypto.plaintext_segments
  end

  def test_empty_plaintext_results_in_an_empty_encode
    skip
    
  end

  def test_non_empty_plaintext_results_in_the_combined_plaintext_segments
    skip
    
  end

  def test_empty_plaintext_results_in_an_empty_ciphertext
    skip
    crypto = Crypto.new('')
    assert_equal "", crypto.ciphertext
  end

  def test_9_character_plaintext_results_in_3_chunks_of_3_characters
    skip
    crypto = Crypto.new('This is fun!')
    assert_equal "tsf hiu isn", crypto.normalize_ciphertext
  end

  def test_54_character_plaintext_results_in_7_chunks_the_last_two_padded_with_spaces
    skip
    crypto = Crypto.new('If man was meant to stay on the ground, god would have given us roots.')
    assert_equal "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau", crypto.normalize_ciphertext
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
