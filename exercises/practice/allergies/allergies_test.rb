require 'minitest/autorun'
require_relative 'allergies'

class AllergiesTest < Minitest::Test
  def test_testing_for_eggs_allergy_not_allergic_to_anything
    # skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("eggs"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_eggs_allergy_allergic_only_to_eggs
    skip
    allergies = Allergies.new(1)
    assert allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_eggs_allergy_allergic_to_eggs_and_something_else
    skip
    allergies = Allergies.new(3)
    assert allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_eggs_allergy_allergic_to_something_but_not_eggs
    skip
    allergies = Allergies.new(2)
    refute allergies.allergic_to?("eggs"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_eggs_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("eggs"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_peanuts_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("peanuts"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_peanuts_allergy_allergic_only_to_peanuts
    skip
    allergies = Allergies.new(2)
    assert allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_peanuts_allergy_allergic_to_peanuts_and_something_else
    skip
    allergies = Allergies.new(7)
    assert allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_peanuts_allergy_allergic_to_something_but_not_peanuts
    skip
    allergies = Allergies.new(5)
    refute allergies.allergic_to?("peanuts"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_peanuts_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("peanuts"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_shellfish_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("shellfish"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_shellfish_allergy_allergic_only_to_shellfish
    skip
    allergies = Allergies.new(4)
    assert allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_shellfish_allergy_allergic_to_shellfish_and_something_else
    skip
    allergies = Allergies.new(14)
    assert allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_shellfish_allergy_allergic_to_something_but_not_shellfish
    skip
    allergies = Allergies.new(10)
    refute allergies.allergic_to?("shellfish"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_shellfish_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("shellfish"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_strawberries_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("strawberries"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_strawberries_allergy_allergic_only_to_strawberries
    skip
    allergies = Allergies.new(8)
    assert allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_strawberries_allergy_allergic_to_strawberries_and_something_else
    skip
    allergies = Allergies.new(28)
    assert allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_strawberries_allergy_allergic_to_something_but_not_strawberries
    skip
    allergies = Allergies.new(20)
    refute allergies.allergic_to?("strawberries"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_strawberries_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("strawberries"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_tomatoes_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("tomatoes"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_tomatoes_allergy_allergic_only_to_tomatoes
    skip
    allergies = Allergies.new(16)
    assert allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_tomatoes_allergy_allergic_to_tomatoes_and_something_else
    skip
    allergies = Allergies.new(56)
    assert allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_tomatoes_allergy_allergic_to_something_but_not_tomatoes
    skip
    allergies = Allergies.new(40)
    refute allergies.allergic_to?("tomatoes"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_tomatoes_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("tomatoes"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_chocolate_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("chocolate"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_chocolate_allergy_allergic_only_to_chocolate
    skip
    allergies = Allergies.new(32)
    assert allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_chocolate_allergy_allergic_to_chocolate_and_something_else
    skip
    allergies = Allergies.new(112)
    assert allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_chocolate_allergy_allergic_to_something_but_not_chocolate
    skip
    allergies = Allergies.new(80)
    refute allergies.allergic_to?("chocolate"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_chocolate_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("chocolate"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_pollen_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("pollen"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_pollen_allergy_allergic_only_to_pollen
    skip
    allergies = Allergies.new(64)
    assert allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_pollen_allergy_allergic_to_pollen_and_something_else
    skip
    allergies = Allergies.new(224)
    assert allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_pollen_allergy_allergic_to_something_but_not_pollen
    skip
    allergies = Allergies.new(160)
    refute allergies.allergic_to?("pollen"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_pollen_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("pollen"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_cats_allergy_not_allergic_to_anything
    skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?("cats"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_cats_allergy_allergic_only_to_cats
    skip
    allergies = Allergies.new(128)
    assert allergies.allergic_to?("cats"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_cats_allergy_allergic_to_cats_and_something_else
    skip
    allergies = Allergies.new(192)
    assert allergies.allergic_to?("cats"), "Tom is allergic, but it says he is not."
  end

  def test_testing_for_cats_allergy_allergic_to_something_but_not_cats
    skip
    allergies = Allergies.new(64)
    refute allergies.allergic_to?("cats"), "Tom is not allergic, but it says he is."
  end

  def test_testing_for_cats_allergy_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert allergies.allergic_to?("cats"), "Tom is allergic, but it says he is not."
  end

  def test_list_when_no_allergies
    skip
    expected = []
    assert_equal expected, Allergies.new(0).list
  end

  def test_list_when_just_eggs
    skip
    expected = ["eggs"]
    assert_equal expected, Allergies.new(1).list
  end

  def test_list_when_just_peanuts
    skip
    expected = ["peanuts"]
    assert_equal expected, Allergies.new(2).list
  end

  def test_list_when_just_strawberries
    skip
    expected = ["strawberries"]
    assert_equal expected, Allergies.new(8).list
  end

  def test_list_when_eggs_and_peanuts
    skip
    expected = %w[eggs peanuts]
    assert_equal expected, Allergies.new(3).list
  end

  def test_list_when_more_than_eggs_but_not_peanuts
    skip
    expected = %w[eggs shellfish]
    assert_equal expected, Allergies.new(5).list
  end

  def test_list_when_lots_of_stuff
    skip
    expected = %w[strawberries tomatoes chocolate pollen cats]
    assert_equal expected, Allergies.new(248).list
  end

  def test_list_when_everything
    skip
    expected = %w[eggs peanuts shellfish strawberries tomatoes chocolate pollen cats]
    assert_equal expected, Allergies.new(255).list
  end

  def test_list_when_no_allergen_score_parts
    skip
    expected = %w[eggs shellfish strawberries tomatoes chocolate pollen cats]
    assert_equal expected, Allergies.new(509).list
  end

  def test_list_when_no_allergen_score_parts_without_highest_valid_score
    skip
    expected = ["eggs"]
    assert_equal expected, Allergies.new(257).list
  end
end
