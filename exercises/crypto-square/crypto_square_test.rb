require 'minitest/autorun'
require_relative 'crypto_square'

# Common test data version: 3.1.0 e937744
class CryptoSquareTest < Minitest::Test
  def test_empty_plaintext_results_in_an_empty_ciphertext
    # skip
    plaintext = ''
    assert_equal "", Crypto.new(plaintext).ciphertext
  end

  def test_lowercase
    skip
    plaintext = 'A'
    assert_equal "a", Crypto.new(plaintext).ciphertext
  end

  def test_remove_spaces
    skip
    plaintext = '  b '
    assert_equal "b", Crypto.new(plaintext).ciphertext
  end

  def test_remove_punctuation
    skip
    plaintext = '@1,%!'
    assert_equal "1", Crypto.new(plaintext).ciphertext
  end

  def test_9_character_plaintext_results_in_3_chunks_of_3_characters
    skip
    plaintext = 'This is fun!'
    assert_equal "tsf hiu isn", Crypto.new(plaintext).ciphertext
  end

  def test_8_character_plaintext_results_in_3_chunks_the_last_one_with_a_trailing_space
    skip
    plaintext = 'Chill out.'
    assert_equal "clu hlt io ", Crypto.new(plaintext).ciphertext
  end

  def test_54_character_plaintext_results_in_7_chunks_the_last_two_with_trailing_spaces
    skip
    plaintext = 'If man was meant to stay on the ground, god would have given us roots.'
    assert_equal "imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ", Crypto.new(plaintext).ciphertext
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
