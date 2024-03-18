require 'minitest/autorun'
require_relative 'knapsack'

class KnapsackTest < Minitest::Test
  Item = Data.define(:weight, :value)

  def test_no_items
    # skip
    max_weight = 100
    items = []
    expected = 0
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "When there are no items, the resulting value must be 0."
  end

  def test_one_item_too_heavy
    skip
    max_weight = 10
    items = [Item.new(weight: 100, value: 1)]
    expected = 0
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "When there is one item that is too heavy, the resulting value must be 0."
  end

  def test_five_items_cannot_be_greedy_by_weight
    skip
    max_weight = 10
    items = [
      Item.new(weight: 2, value: 5),
      Item.new(weight: 2, value: 5),
      Item.new(weight: 2, value: 5),
      Item.new(weight: 2, value: 5),
      Item.new(weight: 10, value: 21)
    ]
    expected = 21
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "Do not prioritize the most valuable items per weight when that would " \
      "result in a lower total value."
  end

  def test_five_items_cannot_be_greedy_by_value
    skip
    max_weight = 10
    items = [
      Item.new(weight: 2, value: 20),
      Item.new(weight: 2, value: 20),
      Item.new(weight: 2, value: 20),
      Item.new(weight: 2, value: 20),
      Item.new(weight: 10, value: 50)
    ]
    expected = 80
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "Do not prioritize the items with the highest value when that would " \
      "result in a lower total value."
  end

  def test_example_knapsack
    skip
    max_weight = 10
    items = [
      Item.new(weight: 5, value: 10),
      Item.new(weight: 4, value: 40),
      Item.new(weight: 6, value: 30),
      Item.new(weight: 4, value: 50)
    ]
    expected = 90
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "A small example knapsack must result in a value of 90."
  end

  def test_eight_items
    skip
    max_weight = 104
    items = [
      Item.new(weight: 25, value: 350),
      Item.new(weight: 35, value: 400),
      Item.new(weight: 45, value: 450),
      Item.new(weight: 5, value: 20),
      Item.new(weight: 25, value: 70),
      Item.new(weight: 3, value: 8),
      Item.new(weight: 2, value: 5),
      Item.new(weight: 2, value: 5)
    ]
    expected = 900
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "A larger example knapsack with 8 items must result in a value of 900."
  end

  def test_fifteen_items
    skip
    max_weight = 750
    items = [
      Item.new(weight: 70, value: 135),
      Item.new(weight: 73, value: 139),
      Item.new(weight: 77, value: 149),
      Item.new(weight: 80, value: 150),
      Item.new(weight: 82, value: 156),
      Item.new(weight: 87, value: 163),
      Item.new(weight: 90, value: 173),
      Item.new(weight: 94, value: 184),
      Item.new(weight: 98, value: 192),
      Item.new(weight: 106, value: 201),
      Item.new(weight: 110, value: 210),
      Item.new(weight: 113, value: 214),
      Item.new(weight: 115, value: 221),
      Item.new(weight: 118, value: 229),
      Item.new(weight: 120, value: 240)
    ]
    expected = 1458
    actual = Knapsack.new(max_weight).max_value(items)

    assert_equal expected, actual,
      "A very large example knapsack with 15 items must result in a value of 1458."
  end
end
