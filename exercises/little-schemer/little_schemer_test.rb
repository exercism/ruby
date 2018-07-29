require 'minitest/autorun'
require_relative 'little_schemer'

class ListTest < Minitest::Test
  def test_null_of_simple_list
    list = [1]
    refute null?(list)
  end

  def test_null_of_empty_list
    list = []
    assert null?(list)
  end

  def test_null_of_non_list
    list = 'Zang'
    assert_raises(ArgumentError) { null?(list) }
  end

  def test_car_of_simple_list
    list = [1]
    assert_equal car(list), 1
  end

  def test_car_of_small_list
    list = ['Immaculate', 23, 'G.O.A.T']
    assert_equal car(list), 'Immaculate'
  end

  def test_car_of_nested_list
    list = [[4, 5], 6, 7, [8, 9]]
    assert_equal car(list), [4, 5]
  end

  def test_car_of_null_list
    null_list = Array.new
    assert_raises ArgumentError do
      car(null_list)
    end
  end

  def test_cdr_of_simple_list
    list = [1]
    assert_equal cdr(list), []
  end

  def test_cdr_of_small_list
    list = ['Immaculate', 23, 'G.O.A.T']
    assert_equal cdr(list), [23, 'G.O.A.T']
  end

  def test_cdr_of_nested_list
    list = [[4, 5], 6, 7, [8, 9]]
    assert_equal cdr(list), [6, 7, [8, 9]]
  end

  def test_cdr_of_null_list
    null_list = Array.new
    assert_raises ArgumentError do
      cdr(null_list)
    end
  end

  def test_atom_of_a_list
    list = ['Lyn', 6]
    assert_equal atom?(list), false
  end

  def test_atom_of_car
    list = ['Lyn', 6]
    assert_equal atom?(car(list)), true
  end

  def test_atom_of_cdr
    list = ['Lyn', 6]
    assert_equal atom?(cdr(list)), false
  end

  def test_lat_of_simple_list
    list = ['Lyn', 6]
    assert_equal lat?(list), false
  end

  def test_lat_of_another_list
    list = ['Lyn', 'Bicycle']
    assert_equal lat?(list), true
  end

  def test_lat_of_nested_list
    nested_list = ['Help', 'I', 'am', ['nested']]
    assert_equal lat?(nested_list), false
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
