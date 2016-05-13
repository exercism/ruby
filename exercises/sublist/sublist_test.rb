#!/usr/bin/env ruby

gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'sublist'

class Sublist < Minitest::Test
  def test_a_subset_b
    a = [1, 2, 3]
    b = [1, 2, 3, 4, 5]

    c = [3, 4, 5]
    d = [1, 2, 3, 4, 5]

    e = [3, 4]
    f = [1, 2, 3, 4, 5]

    assert_equal "A is a subset", sublist(a, b)
    assert_equal "A is a subset", sublist(c, d)
    assert_equal "A is a subset", sublist(e, f)
  end

  def test_a_equal_b
    a = [1, 2, 3]
    b = [1, 2, 3]

    assert_equal "Equal", sublist(a, b)
  end

  def test_a_superset_b
    a = [1, 2, 3, 4, 5]
    b = [2, 3, 4]

    c = [1, 2, 3, 4, 5]
    d = [4, 5]

    assert_equal "A is a superset", sublist(a, b)
    assert_equal "A is a superset", sublist(c, d)
  end

  def test_no_subset_superset
    a = [1, 2, 4]
    b = [1, 2, 3, 4, 5]

    assert_equal "There are no subsets", sublist(a, b)
  end
end
