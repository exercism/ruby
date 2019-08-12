require 'minitest/autorun'
require_relative 'atbash_cipher'

# Common test data version: 1.2.0 d5238bd
class AtbashCipherTest < Minitest::Test
  def test_encode_yes
    # skip
    plaintext = 'yes'
    ciphertext = 'bvh'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_no
    skip
    plaintext = 'no'
    ciphertext = 'ml'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_omg
    skip
    plaintext = 'OMG'
    ciphertext = 'lnt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_spaces
    skip
    plaintext = 'O M G'
    ciphertext = 'lnt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_mindblowingly
    skip
    plaintext = 'mindblowingly'
    ciphertext = 'nrmwy oldrm tob'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_numbers
    skip
    plaintext = 'Testing,1 2 3, testing.'
    ciphertext = 'gvhgr mt123 gvhgr mt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_deep_thought
    skip
    plaintext = 'Truth is fiction.'
    ciphertext = 'gifgs rhurx grlm'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_encode_all_the_letters
    skip
    plaintext = 'The quick brown fox jumps over the lazy dog.'
    ciphertext = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
    assert_equal ciphertext, Atbash.encode(plaintext)
  end

  def test_decode_exercism
    skip
    ciphertext = 'vcvix rhn'
    plaintext = 'exercism'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_a_sentence
    skip
    ciphertext = 'zmlyh gzxov rhlug vmzhg vkkrm thglm v'
    plaintext = 'anobstacleisoftenasteppingstone'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_numbers
    skip
    ciphertext = 'gvhgr mt123 gvhgr mt'
    plaintext = 'testing123testing'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_all_the_letters
    skip
    ciphertext = 'gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt'
    plaintext = 'thequickbrownfoxjumpsoverthelazydog'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_with_too_many_spaces
    skip
    ciphertext = 'vc vix    r hn'
    plaintext = 'exercism'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end

  def test_decode_with_no_spaces
    skip
    ciphertext = 'zmlyhgzxovrhlugvmzhgvkkrmthglmv'
    plaintext = 'anobstacleisoftenasteppingstone'
    assert_equal plaintext, Atbash.decode(ciphertext)
  end
end
