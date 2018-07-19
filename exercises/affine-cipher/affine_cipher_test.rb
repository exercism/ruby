require 'minitest/autorun'
require_relative 'affine_cipher'

class AffineTest < Minitest::Test
  def test_encode_yes
    #skip
    cipher = Affine.new
    cipher.addkey(5, 7)
    assert_equal 'xbt', cipher.encode('yes')
  end

  def test_encode_no
    skip
    cipher = Affine.new
    cipher.addkey(15, 18)
    assert_equal 'fu', cipher.encode('no')
  end

  def test_encode_OMG
    skip
    cipher = Affine.new
    cipher.addkey(21, 3)
    assert_equal 'lvz', cipher.encode('OMG')
  end

  def test_encode_O_M_G
    skip
    cipher = Affine.new
    cipher.addkey(25, 47)
    assert_equal 'hjp', cipher.encode('O M G')
  end

  def test_encode_mindblowingly
    skip
    cipher = Affine.new
    cipher.addkey(11, 15)
    assert_equal 'rzcwa gnxzc dgt', cipher.encode('mindblowingly')
  end

  def test_encode_numbers
    skip
    cipher= Affine.new
    cipher.addkey(3, 4)
    assert_equal 'jqgjc rw123 jqgjc rw', cipher.encode('Testing,1 2 3, testing')
  end

  def test_encode_deep_thought
    skip
    cipher = Affine.new
    cipher.addkey(5, 17)
    assert_equal 'iynia fdqfb ifje', cipher.encode('Truth is fiction.')
  end

  def test_encode_all_the_letters
    skip
    cipher = Affine.new
    cipher.addkey(17, 33)
    plaintext = 'The quick brown fox jumps over the lazy dog.'
    ciphertext = 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
    assert_equal ciphertext, cipher.encode(plaintext)
  end

  def test_encode_with_a_not_coprime_to_m
    skip
    cipher = Affine.new
    assert_raises(ArgumentError) { cipher.addkey(6, 17) }
  end

  def test_decode_exercism
    skip
    cipher = Affine.new
    cipher.addkey(3, 7)
    assert_equal 'exercism', cipher.decode('tytgn fjr')
  end

  def test_decode_a_sentence
    skip
    cipher = Affine.new
    cipher.addkey(19, 16)
    plaintext = 'anobstacleisoftenasteppingstone'
    ciphertext = 'qdwju nqcro muwhn odqun oppmd aunwd o'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_numbers
    skip
    cipher = Affine.new
    cipher.addkey(25, 7)
    assert_equal 'testing123testing', cipher.decode('odpoz ub123 odpoz ub')
  end

  def test_decode_all_the_letters
    skip
    cipher = Affine.new
    cipher.addkey(17, 33)
    plaintext = 'thequickbrownfoxjumpsoverthelazydog'
    ciphertext = 'swxtj npvyk lruol iejdc blaxk swxmh qzglf'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_with_no_spaces_in_input
    skip
    cipher = Affine.new
    cipher.addkey(17, 33)
    plaintext = 'thequickbrownfoxjumpsoverthelazydog'
    ciphertext = 'swxtjnpvyklruoliejdcblaxkswxmhqzglf'
    assert_equal plaintext, cipher.decode(ciphertext)
  end

  def test_decode_with_too_many_spaces
    skip
    cipher = Affine.new
    cipher.addkey(15, 16)
    assert_equal 'jollygreengiant', cipher.decode('vszzm    cly   yd cg    qdp')
  end

  def test_decode_with_a_not_coprime_to_m
    skip
    cipher = Affine.new
    assert_raises(ArgumentError) { cipher.addkey(13, 5) }
  end
end
