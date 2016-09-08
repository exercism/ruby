gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'word_search'

class WordSearchTest < Minitest::Test


  def test_stupid   #Test 0

    puzzle = [
      ["a","s"]
    ]

    word = "as"
    new_game = WordSearch.new(puzzle)

    assert_equal [[1,1],[2,1]], new_game.search(word)

    end

end
