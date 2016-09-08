gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'word_search'

class WordSearchTest < Minitest::Test

   PUZZLE =
     ["jefblpepre",
      "camdcimgtc",
      "oivokprjsm",
      "pbwasqroua",
      "rixilelhrs",
      "wolcqlirpc",
      "screeaumgr",
      "alxhpburyi",
      "jalaycalmp",
      "clojurermt"]


  def test_stupid   #SET TO FAIL!!


    word = "jef"
    new_game = WordSearch.new(PUZZLE)

    assert_equal [[1,1],[1,3]], new_game.stupid_search(word)

    end

  def test_find_horizontal_words_left_to_right
    word = "clojure"
    new_game = WordSearch.new(PUZZLE)

    assert_equal [[9, 0],[9, 6]], new_game.search(word)
  end

end


#fsharp tests
# let puzzle =
#     ["jefblpepre";
#      "camdcimgtc";
#      "oivokprjsm";
#      "pbwasqroua";
#      "rixilelhrs";
#      "wolcqlirpc";
#      "screeaumgr";
#      "alxhpburyi";
#      "jalaycalmp";
#      "clojurermt"]
#
# [<Test>]
# let ``Should find horizontal words written left-to-right`` () =
#     let actual = find puzzle "clojure"
#     Assert.That(actual, Is.EqualTo(Some ((1, 10), (7, 10))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find horizontal words written right-to-left`` () =
#     let actual = find puzzle "elixir"
#     Assert.That(actual, Is.EqualTo(Some ((6, 5), (1, 5))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find vertical words written top-to-bottom`` () =
#     let actual = find puzzle "ecmascript"
#     Assert.That(actual, Is.EqualTo(Some ((10, 1), (10, 10))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find vertical words written bottom-to-top`` () =
#     let actual = find puzzle "rust"
#     Assert.That(actual, Is.EqualTo(Some ((9, 5), (9, 2))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find diagonal words written top-left-to-bottom-right`` () =
#     let actual = find puzzle "java"
#     Assert.That(actual, Is.EqualTo(Some ((1, 1), (4, 4))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find diagonal upper written bottom-right-to-top-left`` () =
#     let actual = find puzzle "lua"
#     Assert.That(actual, Is.EqualTo(Some ((8, 9), (6, 7))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find diagonal upper written bottom-left-to-top-right`` () =
#     let actual = find puzzle "lisp"
#     Assert.That(actual, Is.EqualTo(Some ((3, 6), (6, 3))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should find diagonal upper written top-right-to-bottom-left`` () =
#     let actual = find puzzle "ruby"
#     Assert.That(actual, Is.EqualTo(Some ((8, 6), (5, 9))))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should not find words that are not in the puzzle`` () =
#     let actual = find puzzle "haskell"
#     Assert.That(actual, Is.EqualTo(None))
#
# [<Test>]
# [<Ignore("Remove to run test")>]
# let ``Should be able to search differently-sized puzzles`` () =
#     let differentSizePuzzle =
#         ["qwertyuiopz";
#          "luamsicrexe";
#          "abcdefghijk"]
#
#     let actual = find differentSizePuzzle "exercism"
#     Assert.That(actual, Is.EqualTo(Some ((11, 2), (4, 2))))
