#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'dominoes'

# Test data version:
# 82eb00d
class DominoesTest < Minitest::Test
  def test_empty_input_empty_output
    # skip
    input_dominoes = []
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  def test_singleton_input_singleton_output
    skip
    input_dominoes = [[1, 1]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  def test_singleton_that_can_t_be_chained
    skip
    input_dominoes = [[1, 2]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_nil output_chain, "There should be no chain for #{input_dominoes}"
  end

  def test_three_elements
    skip
    input_dominoes = [[1, 2], [3, 1], [2, 3]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  def test_can_reverse_dominoes
    skip
    input_dominoes = [[1, 2], [1, 3], [2, 3]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  def test_can_t_be_chained
    skip
    input_dominoes = [[1, 2], [4, 1], [2, 3]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_nil output_chain, "There should be no chain for #{input_dominoes}"
  end

  def test_disconnected_simple
    skip
    input_dominoes = [[1, 1], [2, 2]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_nil output_chain, "There should be no chain for #{input_dominoes}"
  end

  def test_disconnected_double_loop
    skip
    input_dominoes = [[1, 2], [2, 1], [3, 4], [4, 3]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_nil output_chain, "There should be no chain for #{input_dominoes}"
  end

  def test_disconnected_single_isolated
    skip
    input_dominoes = [[1, 2], [2, 3], [3, 1], [4, 4]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_nil output_chain, "There should be no chain for #{input_dominoes}"
  end

  def test_need_backtrack
    skip
    input_dominoes = [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  def test_separate_loops
    skip
    input_dominoes = [[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  def test_ten_elements
    skip
    input_dominoes = [[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]]
    output_chain = Dominoes.chain(input_dominoes)
    assert_correct_chain(input_dominoes, output_chain)
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module, which may be placed near the end of your file.
  #
  # In your file, it will look like this:
  #
  # module BookKeeping
  #   VERSION = 1 # Where the version number matches the one in the test.
  # end
  #
  # If you are curious, read more about constants on RubyDoc:
  # http://ruby-doc.org/docs/ruby-doc-bundle/UsersGuide/rg/constants.html
  def test_bookkeeping
    skip
    assert_equal 1, BookKeeping::VERSION
  end

  def assert_correct_chain(input_dominoes, output_chain)
    refute_nil output_chain, "There should be a chain for #{input_dominoes}"
    assert_same_dominoes(input_dominoes, output_chain)
    assert_consecutive_dominoes_match(output_chain)
    return if output_chain.empty?
    assert_dominoes_at_end_match(output_chain)
  end

  def assert_same_dominoes(input_dominoes, output_chain)
    input_normal = input_dominoes.map(&:sort).sort
    output_normal = output_chain.map(&:sort).sort
    assert_equal input_normal, output_normal,
      'Dominoes used in the output must be the same as the ones given in the input'
  end

  def assert_consecutive_dominoes_match(chain)
    chain.each_cons(2).with_index { |(d1, d2), i|
      _, d1_right = d1
      d2_left, _ = d2
      assert_equal d1_right, d2_left,
        "In chain #{chain}, right end of domino #{i} (#{d1}) and left end of domino #{i + 1} (#{d2}) must match"
    }
  end

  def assert_dominoes_at_end_match(chain)
    first_domino = chain.first
    last_domino = chain.last
    d1_left, _ = first_domino
    _, d2_right = last_domino
    assert_equal d1_left, d2_right,
      "In chain #{chain}, left end of first domino (#{first_domino}) and right end of last domino (#{last_domino}) must match"
  end
end
