require 'minitest/autorun'
require_relative 'allergies'

class AllergiesTest < Minitest::Test
  def test_not_allergic_to_anything
    # skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_eggs
    skip
    allergies = Allergies.new(1)
    assert allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_eggs_and_something_else
    skip
    allergies = Allergies.new(3)
    assert allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_eggs
    skip
    allergies = Allergies.new(2)
    refute allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_1
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_peanuts_1
    skip
    allergies = Allergies.new(2)
    assert allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_peanuts_and_something_else_1
    skip
    allergies = Allergies.new(7)
    assert allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_peanuts_1
    skip
    allergies = Allergies.new(5)
    refute allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_1
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_2
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_shellfish_2
    skip
    allergies = Allergies.new(4)
    assert allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_shellfish_and_something_else_2
    skip
    allergies = Allergies.new(14)
    assert allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_shellfish_2
    skip
    allergies = Allergies.new(10)
    refute allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_2
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_3
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_strawberries_3
    skip
    allergies = Allergies.new(8)
    assert allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_strawberries_and_something_else_3
    skip
    allergies = Allergies.new(28)
    assert allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_strawberries_3
    skip
    allergies = Allergies.new(20)
    refute allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_3
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_4
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_tomatoes_4
    skip
    allergies = Allergies.new(16)
    assert allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_tomatoes_and_something_else_4
    skip
    allergies = Allergies.new(56)
    assert allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_tomatoes_4
    skip
    allergies = Allergies.new(40)
    refute allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_4
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_5
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_chocolate_5
    skip
    allergies = Allergies.new(32)
    assert allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_chocolate_and_something_else_5
    skip
    allergies = Allergies.new(112)
    assert allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_chocolate_5
    skip
    allergies = Allergies.new(80)
    refute allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_5
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_6
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_pollen_6
    skip
    allergies = Allergies.new(64)
    assert allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_pollen_and_something_else_6
    skip
    allergies = Allergies.new(224)
    assert allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_pollen_6
    skip
    allergies = Allergies.new(160)
    refute allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_6
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is."
  end

  def test_not_allergic_to_anything_7
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("cats"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_only_to_cats_7
    skip
    allergies = Allergies.new(128)
    assert allergies.allergic_to?("cats"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_cats_and_something_else_7
    skip
    allergies = Allergies.new(192)
    assert allergies.allergic_to?("cats"), "Tom is allergic, but it says he is."
  end

  def test_allergic_to_something_but_not_cats_7
    skip
    allergies = Allergies.new(64)
    refute allergies.allergic_to?("cats"), "Tom is allergic, but it says he is not."
  end

  def test_allergic_to_everything_7
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("cats"), "Tom is allergic, but it says he is."
  end

  def test_no_allergies_8
    skip
    allergies = Allergies.new(0)
    expected = %w[]
    assert_equal expected, allergies.list
  end

  def test_just_eggs_8
    skip
    allergies = Allergies.new(1)
    expected = %w[eggs]
    assert_equal expected, allergies.list
  end

  def test_just_peanuts_8
    skip
    allergies = Allergies.new(2)
    expected = %w[peanuts]
    assert_equal expected, allergies.list
  end

  def test_just_strawberries_8
    skip
    allergies = Allergies.new(8)
    expected = %w[strawberries]
    assert_equal expected, allergies.list
  end

  def test_eggs_and_peanuts_8
    skip
    allergies = Allergies.new(3)
    expected = %w[eggs peanuts]
    assert_equal expected, allergies.list
  end

  def test_more_than_eggs_but_not_peanuts_8
    skip
    allergies = Allergies.new(5)
    expected = %w[eggs shellfish]
    assert_equal expected, allergies.list
  end

  def test_lots_of_stuff_8
    skip
    allergies = Allergies.new(248)
    expected = %w[strawberries tomatoes chocolate pollen cats]
    assert_equal expected, allergies.list
  end

  def test_everything_8
    skip
    allergies = Allergies.new(255)
    expected = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
    assert_equal expected, allergies.list
  end

  def test_no_allergen_score_parts_8
    skip
    allergies = Allergies.new(509)
    expected = %w[eggs shellfish strawberries tomatoes chocolate pollen cats]
    assert_equal expected, allergies.list
  end

  def test_no_allergen_score_parts_without_highest_valid_score_8
    skip
    allergies = Allergies.new(257)
    expected = %w[eggs]
    assert_equal expected, allergies.list
  end
end
