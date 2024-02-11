require 'minitest/autorun'
require_relative 'dnd_character'

module Helpers
  BASE_HITPOINTS = 10

  def attributes
    %i[strength dexterity constitution intelligence wisdom charisma]
  end
end

class DndCharacterTest < Minitest::Test
  include Helpers

  def test_modifier_score_3
    assert_equal(-4, DndCharacter.modifier(3))
  end

  def test_modifier_score_4
    assert_equal(-3, DndCharacter.modifier(4))
  end

  def test_modifier_score_5
    assert_equal(-3, DndCharacter.modifier(5))
  end

  def test_modifier_score_6
    assert_equal(-2, DndCharacter.modifier(6))
  end

  def test_modifier_score_7
    assert_equal(-2, DndCharacter.modifier(7))
  end

  def test_modifier_score_8
    assert_equal(-1, DndCharacter.modifier(8))
  end

  def test_modifier_score_9
    assert_equal(-1, DndCharacter.modifier(9))
  end

  def test_modifier_score_10
    assert_equal 0, DndCharacter.modifier(10)
  end

  def test_modifier_score_11
    assert_equal 0, DndCharacter.modifier(11)
  end

  def test_modifier_score_12
    assert_equal 1, DndCharacter.modifier(12)
  end

  def test_modifier_score_13
    assert_equal 1, DndCharacter.modifier(13)
  end

  def test_modifier_score_14
    assert_equal 2, DndCharacter.modifier(14)
  end

  def test_modifier_score_15
    assert_equal 2, DndCharacter.modifier(15)
  end

  def test_modifier_score_16
    assert_equal 3, DndCharacter.modifier(16)
  end

  def test_modifier_score_17
    assert_equal 3, DndCharacter.modifier(17)
  end

  def test_modifier_score_18
    assert_equal 4, DndCharacter.modifier(18)
  end

  # rubocop:disable Style/FormatString, Style/RedundantPercentQ
  def test_random_character_stats
    100.times do
      character = DndCharacter.new
      allowed_range = (3..18)
      expected_hitpoints = BASE_HITPOINTS +
                           DndCharacter.modifier(character.constitution)
      informative_message = %q(The character's %s must be within %s)

      attributes.each do |attribute|
        assert_includes allowed_range, character.send(attribute),
          informative_message % [attribute, allowed_range]
      end

      informative_message = %q(The character's %s must be %s)

      assert_equal expected_hitpoints, character.hitpoints,
        informative_message % ['hitpoints', expected_hitpoints]
    end
  end

  def test_stats_calculated_once
    informative_message = <<~EXPLAIN
      The character's %<attribute>s must not change if called more than once.
      It was %<first>s, is now %<second>s.
    EXPLAIN

    100.times do
      character = DndCharacter.new

      (attributes << :hitpoints).each do |attribute|
        first = character.send(attribute)
        second = character.send(attribute)

        assert_equal first, second,
          informative_message % { attribute:, first:, second: }
      end
    end
    # rubocop:enable Style/FormatString, Style/RedundantPercentQ
  end
end
