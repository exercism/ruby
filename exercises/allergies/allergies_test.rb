require 'minitest/autorun'
require_relative 'allergies'

# Common test data version: 1.2.0 17a2ab2
class AllergiesTest < Minitest::Test
  def test_no_allergies_means_not_allergic
    # skip
    allergies = Allergies.new(0)
    refute allergies.allergic_to?('peanuts')
    refute allergies.allergic_to?('cats')
    refute allergies.allergic_to?('strawberries')
  end

  def test_is_allergic_to_eggs
    skip
    allergies = Allergies.new(1)
    assert allergies.allergic_to?('eggs')
  end

  def test_allergic_to_eggs_in_addition_to_other_stuff
    skip
    allergies = Allergies.new(5)
    assert allergies.allergic_to?('eggs')
    assert allergies.allergic_to?('shellfish')
    refute allergies.allergic_to?('strawberries')
  end

  def test_allergic_to_strawberries_but_not_peanuts
    skip
    allergies = Allergies.new(9)
    assert allergies.allergic_to?('eggs')
    refute allergies.allergic_to?('peanuts')
    refute allergies.allergic_to?('shellfish')
    assert allergies.allergic_to?('strawberries')
  end

  def test_no_allergies_at_all
    skip
    allergies = Allergies.new(0)
    expected_items = []
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_just_eggs
    skip
    allergies = Allergies.new(1)
    expected_items = ["eggs"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_just_peanuts
    skip
    allergies = Allergies.new(2)
    expected_items = ["peanuts"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_just_strawberries
    skip
    allergies = Allergies.new(8)
    expected_items = ["strawberries"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_eggs_and_peanuts
    skip
    allergies = Allergies.new(3)
    expected_items = ["eggs", "peanuts"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_more_than_eggs_but_not_peanuts
    skip
    allergies = Allergies.new(5)
    expected_items = ["eggs", "shellfish"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_lots_of_stuff
    skip
    allergies = Allergies.new(248)
    expected_items = ["cats", "chocolate", "pollen", "strawberries", "tomatoes"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    expected_items = ["cats", "chocolate", "eggs", "peanuts", "pollen", "shellfish", "strawberries", "tomatoes"]
    assert_equal expected_items, allergies.list.sort
  end

  def test_ignore_non_allergen_score_parts
    skip
    allergies = Allergies.new(509)
    expected_items = ["cats", "chocolate", "eggs", "pollen", "shellfish", "strawberries", "tomatoes"]
    assert_equal expected_items, allergies.list.sort
  end
end
