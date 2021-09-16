require 'minitest/autorun'
require_relative 'list_ops'

class ListOpsTest < Minitest::Test
  def test_count_empty
    assert_equal 0, ListOps.arrays([])
  end

  def test_count_normal
    skip
    assert_equal 5, ListOps.arrays(Array.new(5))
  end

  def test_count_gigantic
    skip
    assert_equal 1_000_000, ListOps.arrays(Array.new(1_000_000))
  end

  def test_reverse_empty
    skip
    assert_equal [], ListOps.reverser([])
  end

  def test_reverse_normal
    skip
    assert_equal [5, 4, 3, 2, 1], ListOps.reverser([1, 2, 3, 4, 5])
  end

  def test_reverse_gigantic
    skip
    expected = (1..1_000_000).to_a.reverse
    assert_equal expected, ListOps.reverser((1..1_000_000).to_a)
  end

  def test_concat_empty
    skip
    assert_equal [], ListOps.concatter([], [])
  end

  def test_concat_normal
    skip
    assert_equal [12, 34, 56, 78], ListOps.concatter([12, 34], [56, 78])
  end

  def test_concat_gigantic
    skip
    input1 = (1..1_000_000).to_a
    input2 = (1_000_001..2_000_000).to_a
    assert_equal (1..2_000_000).to_a, ListOps.concatter(input1, input2)
  end

  def test_mapper_empty
    skip
    assert_equal [], ListOps.mapper([])
  end

  def test_mapper_normal
    skip
    assert_equal [2, 3, 4, 5, 6], ListOps.mapper([1, 2, 3, 4, 5]) { |n| n + 1 }
  end

  def test_mapper_gigantic
    skip
    result = ListOps.mapper((1..1_000_000).to_a) { |n| n + 1 }
    assert_equal (2..1_000_001).to_a, result
  end

  def test_filterer_empty
    skip
    assert_equal [], ListOps.filterer([])
  end

  def test_filterer_normal
    skip
    result = ListOps.filterer([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], &:odd?)
    assert_equal [1, 3, 5, 7, 9], result
  end

  def test_filterer_gigantic
    skip
    result = ListOps.filterer((1..10_000).to_a, &:even?)
    assert_equal (1..10_000).to_a.select(&:even?), result
  end

  def test_sum_reducer_empty
    skip
    assert_equal 0, ListOps.sum_reducer([])
  end

  def test_sum_reducer_normal
    skip
    assert_equal 55, ListOps.sum_reducer([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
  end

  def test_factorial_reducer_empty
    skip
    assert_equal 1, ListOps.factorial_reducer([])
  end

  def test_factorial_reducer_normal
    skip
    input = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    assert_equal 3_628_800, ListOps.factorial_reducer(input)
  end
end
