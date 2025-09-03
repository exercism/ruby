require 'minitest/autorun'
require_relative 'circular_buffer'

class CircularBufferTest < Minitest::Test
  def test_reading_empty_buffer_should_fail
    # skip
    buffer = CircularBuffer.new(1)
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_can_read_an_item_just_written
    skip
    buffer = CircularBuffer.new(1)
    buffer.write('1')
    assert_equal '1', buffer.read
  end

  def test_each_item_may_only_be_read_once
    skip
    buffer = CircularBuffer.new(1)
    buffer.write('1')
    assert_equal '1', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_items_are_read_in_the_order_they_are_written
    skip
    buffer = CircularBuffer.new(2)
    buffer.write('1')
    buffer.write('2')
    assert_equal '1', buffer.read
    assert_equal '2', buffer.read
  end

  def test_full_buffer_cant_be_written_to
    skip
    buffer = CircularBuffer.new(1)
    buffer.write('1')
    assert_raises(CircularBuffer::BufferFullException) { buffer.write('2') }
  end

  def test_a_read_frees_up_capacity_for_another_write
    skip
    buffer = CircularBuffer.new(1)
    buffer.write('1')
    assert_equal '1', buffer.read
    buffer.write('2')
    assert_equal '2', buffer.read
  end

  def test_read_position_is_maintained_even_across_multiple_writes
    skip
    buffer = CircularBuffer.new(3)
    buffer.write('1')
    buffer.write('2')
    assert_equal '1', buffer.read
    buffer.write('3')
    assert_equal '2', buffer.read
    assert_equal '3', buffer.read
  end

  def test_items_cleared_out_of_buffer_cant_be_read
    skip
    buffer = CircularBuffer.new(1)
    buffer.write('1')
    buffer.clear
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end

  def test_clear_frees_up_capacity_for_another_write
    skip
    buffer = CircularBuffer.new(1)
    buffer.write('1')
    buffer.clear
    buffer.write('2')
    assert_equal '2', buffer.read
  end

  def test_clear_does_nothing_on_empty_buffer
    skip
    buffer = CircularBuffer.new(1)
    buffer.clear
    buffer.write('1')
    assert_equal '1', buffer.read
  end

  def test_overwrite_acts_like_write_on_non_full_buffer
    skip
    buffer = CircularBuffer.new(2)
    buffer.write('1')
    buffer.write!('2')
    assert_equal '1', buffer.read
    assert_equal '2', buffer.read
  end

  def test_overwrite_replaces_the_oldest_item_on_full_buffer
    skip
    buffer = CircularBuffer.new(2)
    buffer.write('1')
    buffer.write('2')
    buffer.write!('3')
    assert_equal '2', buffer.read
    assert_equal '3', buffer.read
  end

  def test_overwrite_replaces_the_oldest_item_remaining_in_buffer_following_a_read
    skip
    buffer = CircularBuffer.new(3)
    buffer.write('1')
    buffer.write('2')
    buffer.write('3')
    assert_equal '1', buffer.read
    buffer.write('4')
    buffer.write!('5')
    assert_equal '3', buffer.read
    assert_equal '4', buffer.read
    assert_equal '5', buffer.read
  end

  def test_initial_clear_does_not_affect_wrapping_around
    skip
    buffer = CircularBuffer.new(2)
    buffer.clear
    buffer.write('1')
    buffer.write('2')
    buffer.write!('3')
    buffer.write!('4')
    assert_equal '3', buffer.read
    assert_equal '4', buffer.read
    assert_raises(CircularBuffer::BufferEmptyException) { buffer.read }
  end
end
