require 'minitest/autorun'
require_relative 'simple_linked_list'

class LinkedListTest < Minitest::Test
  def test_element
    element = Element.new(1)
    assert_equal 1, element.datum
  end

  def test_element_can_hold_a_different_value
    skip
    element = Element.new(10)
    assert_equal 10, element.datum
  end

  def test_element_next
    skip
    element = Element.new(1)
    assert_nil element.next
  end

  def test_element_next_can_be_assigned_to
    skip
    first  = Element.new(1)
    second = Element.new(2)
    first.next = second
    assert_equal second, first.next
  end

  def test_list_push
    skip
    list = SimpleLinkedList.new
    element = Element.new(1)
    assert_equal list, list.push(element)
  end

  def test_list_pop
    skip
    list = SimpleLinkedList.new
    element = Element.new(1)
    list.push(element)
    assert_equal element, list.pop
  end

  def test_list_pop_empty
    skip
    list = SimpleLinkedList.new
    assert_nil list.pop
  end

  def test_list_pop_is_last_in_first_out
    skip
    list = SimpleLinkedList.new
    first = Element.new(1)
    second = Element.new(2)
    list.push(first).push(second)
    assert_equal second, list.pop
  end

  def test_list_empty_to_array
    skip
    list = SimpleLinkedList.new
    assert_equal [], list.to_a
  end

  def test_list_single_to_array
    skip
    list = SimpleLinkedList.new
    first = Element.new(1)
    list.push(first)
    assert_equal [1], list.to_a
  end

  def test_list_multiple_to_array
    skip
    list = SimpleLinkedList.new
    first = Element.new(1)
    second = Element.new(2)
    third = Element.new(3)
    list.push(first).push(second).push(third)
    assert_equal [3, 2, 1], list.to_a
  end

  def test_list_create_from_array
    skip
    array = [1, 2, 3]
    list = SimpleLinkedList.new(array)
    assert_equal [3, 2, 1], list.to_a
  end

  def test_list_created_from_array_still_made_up_of_elements
    skip
    array = [1, 2, 3]
    list = SimpleLinkedList.new(array)
    assert_equal Element, list.pop.class
  end

  def test_list_from_array_still_acts_as_lifo
    skip
    array = [1, 2, 3]
    list = SimpleLinkedList.new(array)
    element = list.pop
    assert_equal 3, element.datum
  end

  def test_list_in_place_reverse!
    skip
    first = Element.new(1)
    second = Element.new(2)
    third = Element.new(3)
    list = SimpleLinkedList.new
    list.push(first).push(second).push(third)

    assert_equal [1, 2, 3], list.reverse!.to_a
  end

  def test_list_in_place_reverse_are_the_same_elements
    skip
    first = Element.new(1)
    second = Element.new(2)
    list = SimpleLinkedList.new
    list.push(first).push(second)

    list.reverse!

    assert_equal first, list.pop
    assert_equal second, list.pop
  end

  def test_list_reverse_empty_list
    skip
    list = SimpleLinkedList.new
    assert_equal list, list.reverse!
  end

  def test_works_for_1_through_10
    skip
    list = SimpleLinkedList.new(1..10)
    expected = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
    assert_equal expected, list.to_a
  end

  # Problems in exercism evolve over time, as we find better ways to ask
  # questions.
  # The version number refers to the version of the problem you solved,
  # not your solution.
  #
  # Define a constant named VERSION inside of the top level BookKeeping
  # module.
  #  In your file, it will look like this:
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
end
