require 'minitest/autorun'
require_relative 'atbash_cipher'

class AtbashCipherTest < Minitest::Test
  def test_encode_yes
    # skip
    assert_equal "bvh", Atbash.encode("yes")
  end

  def test_encode_no
    skip
    assert_equal "ml", Atbash.encode("no")
  end

  def test_encode_omg
    skip
    assert_equal "lnt", Atbash.encode("OMG")
  end

  def test_encode_spaces
    skip
    assert_equal "lnt", Atbash.encode("O M G")
  end

  def test_encode_mindblowingly
    skip
    assert_equal "nrmwy oldrm tob", Atbash.encode("mindblowingly")
  end

  def test_encode_numbers
    skip
    assert_equal "gvhgr mt123 gvhgr mt", Atbash.encode("Testing,1 2 3, testing.")
  end

  def test_encode_deep_thought
    skip
    assert_equal "gifgs rhurx grlm", Atbash.encode("Truth is fiction.")
  end

  def test_encode_all_the_letters
    skip
    assert_equal "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt", Atbash.encode("The quick brown fox jumps over the lazy dog.")
  end

  def test_decode_exercism
    skip
    assert_equal "exercism", Atbash.decode("vcvix rhn")
  end

  def test_decode_a_sentence
    skip
    assert_equal "anobstacleisoftenasteppingstone", Atbash.decode("zmlyh gzxov rhlug vmzhg vkkrm thglm v")
  end

  def test_decode_numbers
    skip
    assert_equal "testing123testing", Atbash.decode("gvhgr mt123 gvhgr mt")
  end

  def test_decode_all_the_letters
    skip
    assert_equal "thequickbrownfoxjumpsoverthelazydog", Atbash.decode("gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt")
  end

  def test_decode_with_too_many_spaces
    skip
    assert_equal "exercism", Atbash.decode("vc vix    r hn")
  end

  def test_decode_with_no_spaces
    skip
    assert_equal "anobstacleisoftenasteppingstone", Atbash.decode("zmlyhgzxovrhlugvmzhgvkkrmthglmv")
  end
end
