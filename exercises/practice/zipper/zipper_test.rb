require 'minitest/autorun'
require_relative 'zipper'

# Common test data version: 1.1.0 6fb5601
class ZipperTest < Minitest::Test
  def test_data_is_retained
    # skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.to_tree
    expected =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_left_right_and_value
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.right.value
    expected = 3
    assert_equal expected, value
  end

  def test_dead_end
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.left
    assert_nil value
  end

  def test_tree_from_deep_focus
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.right.to_tree
    expected =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_traversing_up_from_top
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.up
    assert_nil value
  end

  def test_left_right_and_up
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.up.right.up.left.right.value
    expected = 3
    assert_equal expected, value
  end

  def test_left_right_up_and_up
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.right.up.up.value
    expected = 1
    assert_equal expected, value
  end

  def test_set_value
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.set_value(5).to_tree
    expected =
      Node.new(1,
        Node.new(5,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_set_value_after_traversing_up
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.right.up.set_value(5).to_tree
    expected =
      Node.new(1,
        Node.new(5,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_set_left_with_leaf
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.set_left(
      Node.new(5,
        nil,
        nil)
    ).to_tree
    expected =
      Node.new(1,
        Node.new(2,
          Node.new(5,
            nil,
            nil),
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_set_right_with_null
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.set_right(nil).to_tree
    expected =
      Node.new(1,
        Node.new(2,
          nil,
          nil),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_set_right_with_subtree
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.set_right(
      Node.new(6,
        Node.new(7,
          nil,
          nil),
        Node.new(8,
          nil,
          nil))
    ).to_tree
    expected =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(6,
          Node.new(7,
            nil,
            nil),
          Node.new(8,
            nil,
            nil)))
    assert_equal expected, value
  end

  def test_set_value_on_deep_focus
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.right.set_value(5).to_tree
    expected =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(5,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    assert_equal expected, value
  end

  def test_different_paths_to_same_zipper
    skip
    tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    zipper = Zipper.from_tree(tree)
    value = zipper.left.up.right
    expected_tree =
      Node.new(1,
        Node.new(2,
          nil,
          Node.new(3,
            nil,
            nil)),
        Node.new(4,
          nil,
          nil))
    expected_zipper = Zipper.from_tree(expected_tree)
    expected = expected_zipper.right
    assert_equal expected, value
  end
end
