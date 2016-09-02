require 'minitest/autorun'
require_relative 'react'

class ReactTest < Minitest::Test
  def test_input_cells_have_a_value
    reactor = Reactor.new
    input = reactor.create_input(10)
    assert_equal 10, input.value
  end

  def test_input_cells_can_be_set
    reactor = Reactor.new
    input = reactor.create_input(4)
    assert_equal 4, input.value
    input.value = 20
    assert_equal 20, input.value
  end

  def test_compute_cells_calculate_initial_value
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    assert_equal 2, output.value
  end

  def test_compute_cell_takes_inputs_in_the_right_order
    reactor = Reactor.new
    one = reactor.create_input(1)
    two = reactor.create_input(2)
    output = reactor.create_compute(one, two) { |v1, v2| v1 + v2 * 10 }
    assert_equal 21, output.value
  end

  def test_compute_cells_update_value_when_dependencies_are_changed
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    assert_equal 2, output.value
    input.value = 3
    assert_equal 4, output.value
  end

  def test_compute_cell_can_depend_on_other_compute_cells
    reactor = Reactor.new
    input = reactor.create_input(1)
    times_two = reactor.create_compute(input) { |v| v * 2 }
    times_thirty = reactor.create_compute(input) { |v| v * 30 }
    output = reactor.create_compute(times_two, times_thirty) { |v1, v2| v1 + v2 }
    assert_equal 32, output.value
    input.value = 3
    assert_equal 96, output.value
  end

  def test_compute_cells_fire_callbacks
    values = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    output.add_callback { |v| values << v }
    input.value = 3
    assert_equal [4], values
  end

  def test_callbacks_only_fire_on_change
    values = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v < 3 ? 111 : 222 }
    output.add_callback { |v| values << v }
    input.value = 2
    assert_equal [], values
    input.value = 4
    assert_equal [222], values
  end

  def test_callbacks_can_fire_multiple_times
    values = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    output.add_callback { |v| values << v }
    input.value = 2
    assert_equal [3], values
    input.value = 3
    assert_equal [3, 4], values
  end

  def test_callbacks_can_fire_from_multiple_cells
    values1 = []
    values2 = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    plus_one = reactor.create_compute(input) { |v| v + 1 }
    minus_one = reactor.create_compute(input) { |v| v - 1 }
    plus_one.add_callback { |v| values1 << v }
    minus_one.add_callback { |v| values2 << v }
    input.value = 10
    assert_equal [11], values1
    assert_equal [9], values2
  end

  def test_callbacks_can_be_added_and_removed
    values1 = []
    values2 = []
    values3 = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    callback = output.add_callback { |v| values1 << v }
    output.add_callback { |v| values2 << v }
    input.value = 31
    assert_equal [32], values1
    assert_equal [32], values2
    output.remove_callback(callback)
    output.add_callback { |v| values3 << v }
    input.value = 41
    assert_equal [32], values1, 'callback should not be called after removal'
    assert_equal [32, 42], values2
    assert_equal [42], values3
  end

  def test_removing_a_callback_multiple_times_doesnt_interfere_with_others
    values1 = []
    values2 = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    callback = output.add_callback { |v| values1 << v }
    output.add_callback { |v| values2 << v }
    10.times { output.remove_callback(callback) }
    input.value = 2
    assert_equal [], values1
    assert_equal [3], values2
  end

  def test_removing_a_callback_multiple_times_doesnt_interfere_with_others
    values1 = []
    values2 = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    output = reactor.create_compute(input) { |v| v + 1 }
    callback = output.add_callback { |v| values1 << v }
    output.add_callback { |v| values2 << v }
    10.times { output.remove_callback(callback) }
    input.value = 2
    assert_equal [], values1
    assert_equal [3], values2
  end

  def test_callbacks_should_only_be_called_once_even_if_multiple_dependencies_change
    values = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    plus_one = reactor.create_compute(input) { |v| v + 1 }
    minus_one1 = reactor.create_compute(input) { |v| v - 1 }
    minus_one2 = reactor.create_compute(minus_one1) { |v| v - 1 }
    output = reactor.create_compute(plus_one, minus_one2) { |v1, v2| v1 * v2 }
    output.add_callback { |v| values << v }
    input.value = 4
    assert_equal [10], values
  end

  def test_callbacks_should_not_be_called_if_dependencies_change_but_output_value_doesnt_change
    values = []
    reactor = Reactor.new
    input = reactor.create_input(1)
    plus_one = reactor.create_compute(input) { |v| v + 1 }
    minus_one = reactor.create_compute(input) { |v| v - 1 }
    always_two = reactor.create_compute(plus_one, minus_one) { |v1, v2| v1 - v2 }
    always_two.add_callback { |v| values << v }
    10.times { |i|
      input.value = i
      assert_equal [], values
    }
  end
end
