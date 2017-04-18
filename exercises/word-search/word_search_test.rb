gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'word_search'

class WordSearchTest < Minitest::Test

  # GO EQUIVALENT
  # var words = []string{
  # "clojure", "ecmascript", "elixir", "go", "java", "lisp",
  # "ocaml", "ruby", "rust", "scheme",
  # }

  @@words = [
    "clojure", "ecmascript", "elixir", "go", "java", "lisp",
    "ocaml", "ruby", "rust", "scheme"
  ]

  
  # GO EQUIVALENT
  #   var puzzle = []string{
  #   "gefblpepre",
  #   "cbmdcimguc",
  #   "oikoknrjsm",
  #   "pbwjrqrota",
  #   "rixilelhgs",
  #   "woncqlispc",
  #   "schemekmgr",
  #   "alxhprubyi",
  #   "javaocamlp",
  #   "clojurermt",
  # }
  @@puzzle = [
    "gefblpepre",
    "cbmdcimguc",
    "oikoknrjsm",
    "pbwjrqrota",
    "rixilelhgs",
    "woncqlispc",
    "schemekmgr",
    "alxhprubyi",
    "javaocamlp",
    "clojurermt"
  ]


# Top left corner is (0, 0)
# Entries are [[firstX, firstY], [lastX, lastY]].
# i.e. position of first letter: position[:clojure][0] and
# position of last letter: position[:clojure][1]

  @@positions = {
    clojure:    [[0, 9], [6, 9]],
    ecmascript: [[9, 0], [9, 9]],
    elixir:     [[5, 4], [0, 4]],
    go:         [[8, 4], [7, 3]],
    java:       [[0, 8], [3, 8]],
    lisp:       [[5, 5], [8, 5]],
    ocaml:      [[4, 8], [8, 8]],
    ruby:       [[5, 7], [8, 7]],
    rust:       [[8, 0], [8, 3]],
    scheme:     [[0, 6], [5, 6]]
  }

# GO EQUIVALENT
# // Top left corner is (0, 0)
# // Entries are {{firstX, firstY}, {lastX, lastY}}.
# var positions = map[string][2][2]int{
#   "clojure":    {{0, 9}, {6, 9}},
#   "ecmascript": {{9, 0}, {9, 9}},
#   "elixir":     {{5, 4}, {0, 4}},
#   "go":         {{8, 4}, {7, 3}},
#   "java":       {{0, 8}, {3, 8}},
#   "lisp":       {{5, 5}, {8, 5}},
#   "ocaml":      {{4, 8}, {8, 8}},
#   "ruby":       {{5, 7}, {8, 7}},
#   "rust":       {{8, 0}, {8, 3}},
#   "scheme":     {{0, 6}, {5, 6}},
# }

# func TestSolve(t *testing.T) {
#   if testVersion != targetTestVersion {
#     t.Fatalf("Found testVersion = %v, want %v", testVersion, targetTestVersion)
#   }
#   actual, err := Solve(words, puzzle)
#   if err != nil {
#     t.Fatalf("Didn't expect error but got %v", err)
#   }
#   if !reflect.DeepEqual(actual, positions) {
#     t.Fatalf("Got %v, want %v", actual, positions)
#   }
# }

# func BenchmarkSolve(b *testing.B) {
#   for i := 0; i < b.N; i++ {
#     Solve(words, puzzle)
#   }
# }

#Returns correct first coordinate if word is found
#WordSearcher("clojure", @@puzzle) #=> [[0, 9], [6, 9]]

#Returns correct second coordinate if word is found
#WordSearcher("clojure", @@puzzle) #=> [[0, 9], [6, 9]]

#Returns 'word not found' if word is not found
#WordSearcher("swift", @@puzzle) #=> "word not found"

#Arguments must include puzzle AND word
#WordSearcher("clojure") #=> "WordSearcher takes two arguments"
#WordSearcher(@@puzzle)) #=> "WordSearcher takes two arguments"


  def test_returns_correct_first_coordinate_if_word_found
    output = WordSearcher("clojure", @@puzzle)
    assert_equal [0,9], output[0]
  end

  def test_returns_correct_second_coordinate_if_word_found
    output = WordSearcher("clojure", @@puzzle)
    assert_equal [6,9], output[1]
  end

  def test_returns_word_not_found_if_word_not_found
    output = WordSearcher("swift", @@puzzle)
    assert_equal "The word was not found", output
  end

end


