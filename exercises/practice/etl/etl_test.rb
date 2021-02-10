require 'minitest/autorun'
require_relative 'etl'

# Common test data version: 1.0.0 ca9ed58
class EtlTest < Minitest::Test
  def test_a_single_letter
    # skip
    old = {
      1 => ["A"]
    }
    expected = {
      'a' => 1
    }
    assert_equal expected, ETL.transform(old)
  end

  def test_single_score_with_multiple_letters
    skip
    old = {
      1 => %w[A E I O U]
    }
    expected = {
      'a' => 1,
      'e' => 1,
      'i' => 1,
      'o' => 1,
      'u' => 1
    }
    assert_equal expected, ETL.transform(old)
  end

  def test_multiple_scores_with_multiple_letters
    skip
    old = {
      1 => %w[A E],
      2 => %w[D G]
    }
    expected = {
      'a' => 1,
      'd' => 2,
      'e' => 1,
      'g' => 2
    }
    assert_equal expected, ETL.transform(old)
  end

  def test_multiple_scores_with_differing_numbers_of_letters
    skip
    old = {
      1 => %w[A E I O U L N R S T],
      2 => %w[D G],
      3 => %w[B C M P],
      4 => %w[F H V W Y],
      5 => ["K"],
      8 => %w[J X],
      10 => %w[Q Z]
    }
    expected = {
      'a' => 1,
      'b' => 3,
      'c' => 3,
      'd' => 2,
      'e' => 1,
      'f' => 4,
      'g' => 2,
      'h' => 4,
      'i' => 1,
      'j' => 8,
      'k' => 5,
      'l' => 1,
      'm' => 3,
      'n' => 1,
      'o' => 1,
      'p' => 3,
      'q' => 10,
      'r' => 1,
      's' => 1,
      't' => 1,
      'u' => 1,
      'v' => 4,
      'w' => 4,
      'x' => 8,
      'y' => 4,
      'z' => 10
    }
    assert_equal expected, ETL.transform(old)
  end
end
