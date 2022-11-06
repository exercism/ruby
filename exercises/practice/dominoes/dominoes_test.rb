require 'minitest/autorun'
require_relative 'dominoes'

class DominoesTest < Minitest::Test
  def test_empty_input_empty_output
    # skip
    dominoes = []
    assert Dominoes.chain?(dominoes)
  end

  def test_singleton_input_singleton_output
    skip
    dominoes = [[1, 1]]
    assert Dominoes.chain?(dominoes)
  end

  def test_singleton_that_cant_be_chained
    skip
    dominoes = [[1, 2]]
    refute Dominoes.chain?(dominoes)
  end

  def test_three_elements
    skip
    dominoes = [[1, 2], [3, 1], [2, 3]]
    assert Dominoes.chain?(dominoes)
  end

  def test_can_reverse_dominoes
    skip
    dominoes = [[1, 2], [1, 3], [2, 3]]
    assert Dominoes.chain?(dominoes)
  end

  def test_cant_be_chained
    skip
    dominoes = [[1, 2], [4, 1], [2, 3]]
    refute Dominoes.chain?(dominoes)
  end

  def test_disconnected_simple
    skip
    dominoes = [[1, 1], [2, 2]]
    refute Dominoes.chain?(dominoes)
  end

  def test_disconnected_double_loop
    skip
    dominoes = [[1, 2], [2, 1], [3, 4], [4, 3]]
    refute Dominoes.chain?(dominoes)
  end

  def test_disconnected_single_isolated
    skip
    dominoes = [[1, 2], [2, 3], [3, 1], [4, 4]]
    refute Dominoes.chain?(dominoes)
  end

  def test_need_backtrack
    skip
    dominoes = [[1, 2], [2, 3], [3, 1], [2, 4], [2, 4]]
    assert Dominoes.chain?(dominoes)
  end

  def test_separate_loops
    skip
    dominoes = [[1, 2], [2, 3], [3, 1], [1, 1], [2, 2], [3, 3]]
    assert Dominoes.chain?(dominoes)
  end

  def test_nine_elements
    skip
    dominoes = [[1, 2], [5, 3], [3, 1], [1, 2], [2, 4], [1, 6], [2, 3], [3, 4], [5, 6]]
    assert Dominoes.chain?(dominoes)
  end

  def test_separate_three_domino_loops
    skip
    dominoes = [[1, 2], [2, 3], [3, 1], [4, 5], [5, 6], [6, 4]]
    refute Dominoes.chain?(dominoes)
  end
end
