require 'minitest/autorun'
require_relative 'parallel_letter_frequency'

# rubocop:disable Layout/SpaceInsideHashLiteralBraces
class ParallelLetterFrequencyTest < Minitest::Test
  def test_no_texts
    # skip
    texts = %w[]
    expected = {}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_one_text_one_letter
    skip
    texts = %w[a]
    expected = {'a' => 1}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_one_text_multiple_letters
    skip
    texts = %w[abbca]
    expected = {'a' => 2, 'b' => 2, 'c' => 1}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_two_texts_one_letter
    skip
    texts = %w[a a]
    expected = {'a' => 2}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_two_texts_multiple_letters
    skip
    texts = %w[abcd ac]
    expected = {'a' => 2, 'b' => 1, 'c' => 2, 'd' => 1}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_ignore_letter_case
    skip
    texts = %w[Aa aA]
    expected = {'a' => 4}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_ignore_whitespace
    skip
    texts = ['  ', "\t", "\n", "\r\n"]
    expected = {}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_ignore_punctuation
    skip
    texts = ['!', '?', ';', ',', '.', '-', '—', '’', "'", '"', '/', ':', '{}', '[]', '()']
    expected = {}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_ignore_numbers
    skip
    texts = %w[1 2 3 4 5 6 7 8 9 0]
    expected = {}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_unicode_letters
    skip
    texts = %w[本 φ ほ ø]
    expected = {'本' => 1, 'φ' => 1, 'ほ' => 1, 'ø' => 1}
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_combo_lower_upper_punctuation_whitespace
    skip
    ruby_wiki = File.read(File.expand_path('data/ruby_wiki.txt', __dir__))
    texts = [ruby_wiki]
    expected = {
      "r" => 34,
      "u" => 20,
      "b" => 10,
      "y" => 14,
      "i" => 53,
      "s" => 26,
      "a" => 46,
      "n" => 37,
      "t" => 34,
      "e" => 39,
      "p" => 28,
      "d" => 24,
      "h" => 10,
      "g" => 23,
      "l" => 26,
      "v" => 6,
      "o" => 26,
      "m" => 25,
      "w" => 5,
      "c" => 18,
      "j" => 5,
      "k" => 2,
      "z" => 1,
      "f" => 4
    }
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_large_texts
    skip
    ch37 = File.read(File.expand_path('data/moby_dick_ch37.txt', __dir__))
    ch38 = File.read(File.expand_path('data/moby_dick_ch38.txt', __dir__))
    ch39 = File.read(File.expand_path('data/moby_dick_ch39.txt', __dir__))
    texts = [ch37, ch38, ch39]
    expected = {
      "f" => 89,
      "o" => 333,
      "r" => 250,
      "e" => 570,
      "t" => 429,
      "p" => 57,
      "s" => 311,
      "u" => 131,
      "b" => 110,
      "l" => 260,
      "a" => 356,
      "n" => 278,
      "d" => 184,
      "m" => 156,
      "i" => 352,
      "g" => 120,
      "c" => 77,
      "h" => 308,
      "y" => 113,
      "v" => 52,
      "k" => 49,
      "q" => 2,
      "w" => 133,
      "x" => 2,
      "j" => 6,
      "z" => 4
    }
    actual = ParallelLetterFrequency.count(texts)
    assert_equal expected, actual
  end

  def test_many_small_texts
    skip
    texts = Array.new(100, 'abc')
    actual = ParallelLetterFrequency.count(texts)
    expected = {'a' => 100, 'b' => 100, 'c' => 100}
    assert_equal expected, actual
  end

  def test_faster_than_serialized_answer
    skip
    texts = Array.new(20, 'a' * 100_000)

    GC.start
    t0_parallel = Minitest.clock_time
    ParallelLetterFrequency.count(texts)
    parallel_time = Minitest.clock_time - t0_parallel

    t0_sequential = Minitest.clock_time
    sequential_letter_frequency(texts)
    sequential_time = Minitest.clock_time - t0_sequential

    assert parallel_time < sequential_time,
      'Parallel execution should be faster than sequential for batches of large texts'
  end

  def sequential_letter_frequency(texts)
    tally = Hash.new(0)
    texts.each do |text|
      text.each_grapheme_cluster do |cluster|
        tally[cluster] += 1
      end
    end

    tally
  end
end
# rubocop:enable Layout/SpaceInsideHashLiteralBraces
