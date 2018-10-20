require 'minitest/autorun'
require_relative 'high_score_list'

# Common test data version: 1.0.0 4b71acc
class HighScoreListTest < Minitest::Test
  def test_returns_the_highest_score
    # skip
    assert_equal 10, HighScoreList.new([4, 10, 7]).highest
  end
end
