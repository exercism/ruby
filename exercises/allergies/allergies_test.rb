require 'minitest/autorun'
require_relative 'allergies'

# Common test data version: 1.0.0 879bc89
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

  def test_no_allergies_at_all
    skip
    allergies = Allergies.new(0)
    assert_equal %w(), allergies.list
  end

  def test_allergic_to_just_eggs
    skip
    allergies = Allergies.new(1)
    assert_equal %w(eggs), allergies.list
  end

  def test_allergic_to_just_peanuts
    skip
    allergies = Allergies.new(2)
    assert_equal %w(peanuts), allergies.list
  end

  def test_allergic_to_just_strawberries
    skip
    allergies = Allergies.new(8)
    assert_equal %w(strawberries), allergies.list
  end

  def test_allergic_to_eggs_and_peanuts
    skip
    allergies = Allergies.new(3)
    assert_equal %w(eggs peanuts), allergies.list
  end

  def test_allergic_to_more_than_eggs_but_not_peanuts
    skip
    allergies = Allergies.new(5)
    assert_equal %w(eggs shellfish), allergies.list
  end

  def test_allergic_to_lots_of_stuff
    skip
    allergies = Allergies.new(248)
    assert_equal %w(strawberries tomatoes chocolate pollen cats), allergies.list
  end

  def test_allergic_to_everything
    skip
    allergies = Allergies.new(255)
    assert_equal %w(eggs peanuts shellfish strawberries tomatoes chocolate pollen cats), allergies.list
  end

  def test_ignore_non_allergen_score_parts
    skip
    allergies = Allergies.new(509)
    assert_equal %w(eggs shellfish strawberries tomatoes chocolate pollen cats), allergies.list
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
