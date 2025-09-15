require 'minitest/autorun'
require_relative 'linked_list'

class DequeTest < Minitest::Test
  def test_pop_gets_element_from_the_list
    ## skip
    deque = Deque.new
    deque.push(7)
    assert_equal 7, deque.pop
  end

  def test_pushpop_respectively_addremove_at_the_end_of_the_list
    # skip
    deque = Deque.new
    deque.push(11)
    deque.push(13)
    assert_equal 13, deque.pop
    assert_equal 11, deque.pop
  end

  def test_shift_gets_an_element_from_the_list
    # skip
    deque = Deque.new
    deque.push(17)
    assert_equal 17, deque.shift
  end

  def test_shift_gets_first_element_from_the_list
    # skip
    deque = Deque.new
    deque.push(23)
    deque.push(5)
    assert_equal 23, deque.shift
    assert_equal 5, deque.shift
  end

  def test_unshift_adds_element_at_start_of_the_list
    # skip
    deque = Deque.new
    deque.unshift(23)
    deque.unshift(5)
    assert_equal 5, deque.shift
    assert_equal 23, deque.shift
  end

  def test_pop_push_shift_and_unshift_can_be_used_in_any_order
    # skip
    deque = Deque.new
    deque.push(1)
    deque.push(2)
    assert_equal 2, deque.pop
    deque.push(3)
    assert_equal 1, deque.shift
    deque.unshift(4)
    deque.push(5)
    assert_equal 4, deque.shift
    assert_equal 5, deque.pop
    assert_equal 3, deque.shift
  end

  def test_count_an_empty_list
    # skip
    deque = Deque.new
    assert_equal 0, deque.count
  end

  def test_count_a_list_with_items
    # skip
    deque = Deque.new
    deque.push(37)
    deque.push(1)
    assert_equal 2, deque.count
  end

  def test_count_is_correct_after_mutation
    # skip
    deque = Deque.new
    deque.push(31)
    assert_equal 1, deque.count
    deque.unshift(43)
    assert_equal 2, deque.count
    deque.shift
    assert_equal 1, deque.count
    deque.pop
    assert_equal 0, deque.count
  end

  def test_popping_to_empty_doesnt_break_the_list
    # skip
    deque = Deque.new
    deque.push(41)
    deque.push(59)
    deque.pop
    deque.pop
    deque.push(47)
    assert_equal 1, deque.count
    assert_equal 47, deque.pop
  end

  def test_shifting_to_empty_doesnt_break_the_list
    # skip
    deque = Deque.new
    deque.push(41)
    deque.push(59)
    deque.shift
    deque.shift
    deque.push(47)
    assert_equal 1, deque.count
    assert_equal 47, deque.shift
  end

  def test_deletes_the_only_element
    # skip
    deque = Deque.new
    deque.push(61)
    deque.delete(61)
    assert_equal 0, deque.count
  end

  def test_deletes_the_element_with_the_specified_value_from_the_list
    # skip
    deque = Deque.new
    deque.push(71)
    deque.push(83)
    deque.push(79)
    deque.delete(83)
    assert_equal 2, deque.count
    assert_equal 79, deque.pop
    assert_equal 71, deque.shift
  end

  def test_deletes_the_element_with_the_specified_value_from_the_list_re_assigns_tail
    # skip
    deque = Deque.new
    deque.push(71)
    deque.push(83)
    deque.push(79)
    deque.delete(83)
    assert_equal 2, deque.count
    assert_equal 79, deque.pop
    assert_equal 71, deque.pop
  end

  def test_deletes_the_element_with_the_specified_value_from_the_list_re_assigns_head
    # skip
    deque = Deque.new
    deque.push(71)
    deque.push(83)
    deque.push(79)
    deque.delete(83)
    assert_equal 2, deque.count
    assert_equal 71, deque.shift
    assert_equal 79, deque.shift
  end

  def test_deletes_the_first_of_two_elements
    # skip
    deque = Deque.new
    deque.push(97)
    deque.push(101)
    deque.delete(97)
    assert_equal 1, deque.count
    assert_equal 101, deque.pop
  end

  def test_deletes_the_second_of_two_elements
    # skip
    deque = Deque.new
    deque.push(97)
    deque.push(101)
    deque.delete(101)
    assert_equal 1, deque.count
    assert_equal 97, deque.pop
  end

  def test_delete_does_not_modify_the_list_if_the_element_is_not_found
    # skip
    deque = Deque.new
    deque.push(89)
    deque.delete(103)
    assert_equal 1, deque.count
  end

  def test_deletes_only_the_first_occurrence
    # skip
    deque = Deque.new
    deque.push(73)
    deque.push(9)
    deque.push(9)
    deque.push(107)
    deque.delete(9)
    assert_equal 3, deque.count
    assert_equal 107, deque.pop
    assert_equal 9, deque.pop
    assert_equal 73, deque.pop
  end
end
