require 'minitest/autorun'
require_relative 'little_schemer'

# Common test data version: 1.0.0 61b6bee
class LittleSchemerTest < Minitest::Test
  def test_null_of_non_empty_list
    # skip
    list = [1]
    refute null?(list)
  end

  def test_null_of_empty_list
    skip
    list = []
    assert null?(list)
  end

  def test_null_of_non_list
    skip
    list = 'Zang'
    assert_raises ArgumentError do
      null?(list)
    end
  end

  def test_car_of_simple_list
    skip
    list = [1]
    assert_equal car(list), 1
  end

  def test_car_of_small_list
    skip
    list = ["Immaculate", 23, "G.O.A.T"]
    assert_equal car(list), 'Immaculate'
  end

  def test_car_of_nested_list
    skip
    list = [[4, 5], 6, 7, [8, 9]]
    assert_equal car(list), [4, 5]
  end

  def test_car_of_null_list
    skip
    list = []
    assert_raises ArgumentError do
      car(list)
    end
  end

  def test_cdr_of_simple_list
    skip
    list = [1]
    assert_equal cdr(list), []
  end

  def test_cdr_of_small_list
    skip
    list = ["Immaculate", 23, "G.O.A.T"]
    assert_equal cdr(list), [23, "G.O.A.T"]
  end

  def test_cdr_of_nested_list
    skip
    list = [[4, 5], 6, 7, [8, 9]]
    assert_equal cdr(list), [6, 7, [8, 9]]
  end

  def test_cdr_of_null_list
    skip
    list = []
    assert_raises ArgumentError do
      cdr(list)
    end
  end

  def test_atom_of_a_list
    skip
    list = ["Immaculate", 23]
    refute atom?(list)
  end

  def test_atom_of_a_string
    skip
    list = 'Immaculate'
    assert atom?(list)
  end

  def test_atom_of_an_integer
    skip
    list = 23
    assert atom?(list)
  end

  def test_atom_of_null_list
    skip
    list = []
    refute atom?(list)
  end

  def test_lat_of_a_simple_list
    skip
    list = ["Immaculate", 23]
    assert lat?(list)
  end

  def test_lat_of_another_list
    skip
    list = ["Immaculate", "Bicycle"]
    assert lat?(list)
  end

  def test_lat_of_nested_list
    skip
    list = ["Help", "I", "am", ["nested"]]
    refute lat?(list)
  end

  def test_lat_of_null_list
    skip
    list = []
    assert lat?(list)
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
end
