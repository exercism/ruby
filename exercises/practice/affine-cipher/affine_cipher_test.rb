require 'minitest/autorun'
require_relative 'affine_cipher'

class AffineCipherTest < Minitest::Test
  def test_encode_yes
    # skip
    cipher = Affine.new(5, 7)
    plaintext = 'yes'
    ciphertext = 'xbt'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_no
    skip
    cipher = Affine.new(15, 18)
    plaintext = 'no'
    ciphertext = 'fu'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_omg
    skip
    cipher = Affine.new(21, 3)
    plaintext = 'OMG'
    ciphertext = 'lvz'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_o_m_g
    skip
    cipher = Affine.new(25, 47)
    plaintext = 'O M G'
    ciphertext = 'hjp'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_mindblowingly
    skip
    cipher = Affine.new(11, 15)
    plaintext = 'mindblowingly'
    ciphertext = 'rzcwa gnxzc dgt'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_numbers
    skip
    cipher = Affine.new(3, 4)
    plaintext = 'Testing,1 2 3, testing.'
    ciphertext = 'jqgjc rw123 jqgjc rw'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_deep_thought
    skip
    cipher = Affine.new(5, 17)
    plaintext = 'Truth is fiction.'
    ciphertext = 'iynia fdqfb ifje'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_all_the_letters
    skip
    cipher = Affine.new(17, 33)
    plaintext = 'The quick brown fox jumps over the lazy dog.'
    ciphertext = 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_with_a_not_coprime_to_m
    skip
    assert_raises(ArgumentError) { Affine.new(6, 17) }
  end

  def test_decode_exercism
    skip
    cipher = Affine.new(3, 7)
    ciphertext = 'tytgn fjr'
    plaintext = 'exercism'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_a_sentence
    skip
    cipher = Affine.new(19, 16)
    ciphertext = 'qdwju nqcro muwhn odqun oppmd aunwd o'
    plaintext = 'anobstacleisoftenasteppingstone'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_numbers
    skip
    cipher = Affine.new(25, 7)
    ciphertext = 'odpoz ub123 odpoz ub'
    plaintext = 'testing123testing'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_all_the_letters
    skip
    cipher = Affine.new(17, 33)
    ciphertext = 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
    plaintext = 'thequickbrownfoxjumpsoverthelazydog'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_with_no_spaces_in_input
    skip
    cipher = Affine.new(17, 33)
    ciphertext = 'swxtjnpvyklruoliejdcblaxkswxmhqzglf'
    plaintext = 'thequickbrownfoxjumpsoverthelazydog'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_with_too_many_spaces
    skip
    cipher = Affine.new(15, 16)
    ciphertext = 'vszzm    cly   yd cg    qdp'
    plaintext = 'jollygreengiant'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_with_a_not_coprime_to_m
    skip
    assert_raises(ArgumentError) { Affine.new(13, 5) }
  end
end
