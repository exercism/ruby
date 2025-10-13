require 'minitest/autorun'
require_relative 'proverb'

class ProverbTest < Minitest::Test
  def test_zero_pieces
    ## skip
    chain = %w[]
    proverb = Proverb.new(*chain)
    actual = proverb.to_s
    expected = ""
    assert_equal expected, actual
  end

  def test_one_piece
    # skip
    chain = %w[nail]
    proverb = Proverb.new(*chain)
    actual = proverb.to_s
    expected = "And all for the want of a nail."
    assert_equal expected, actual
  end

  def test_two_pieces
    # skip
    chain = %w[nail shoe]
    proverb = Proverb.new(*chain)
    actual = proverb.to_s
    expected = "For want of a nail the shoe was lost.\n" \
      "And all for the want of a nail."
    assert_equal expected, actual
  end

  def test_three_pieces
    # skip
    chain = %w[nail shoe horse]
    proverb = Proverb.new(*chain)
    actual = proverb.to_s
    expected = "For want of a nail the shoe was lost.\n" \
      "For want of a shoe the horse was lost.\n" \
      "And all for the want of a nail."
    assert_equal expected, actual
  end

  def test_full_proverb
    # skip
    chain = %w[nail shoe horse rider message battle kingdom]
    proverb = Proverb.new(*chain)
    actual = proverb.to_s
    expected = "For want of a nail the shoe was lost.\n" \
      "For want of a shoe the horse was lost.\n" \
      "For want of a horse the rider was lost.\n" \
      "For want of a rider the message was lost.\n" \
      "For want of a message the battle was lost.\n" \
      "For want of a battle the kingdom was lost.\n" \
      "And all for the want of a nail."
    assert_equal expected, actual
  end

  def test_four_pieces_modernized
    # skip
    chain = %w[pin gun soldier battle]
    proverb = Proverb.new(*chain)
    actual = proverb.to_s
    expected = "For want of a pin the gun was lost.\n" \
      "For want of a gun the soldier was lost.\n" \
      "For want of a soldier the battle was lost.\n" \
      "And all for the want of a pin."
    assert_equal expected, actual
  end

  def test_an_optional_qualifier_in_the_final_consequence
    # skip
    chain = %w[nail shoe horse rider message battle kingdom]
    proverb = Proverb.new(*chain, qualifier: 'horseshoe')
    actual = proverb.to_s
    expected = "For want of a nail the shoe was lost.\n" \
      "For want of a shoe the horse was lost.\n" \
      "For want of a horse the rider was lost.\n" \
      "For want of a rider the message was lost.\n" \
      "For want of a message the battle was lost.\n" \
      "For want of a battle the kingdom was lost.\n" \
      "And all for the want of a horseshoe nail."
    assert_equal expected, actual
  end

  def test_proverb_is_same_each_time
    # skip
    chain = %w[nail shoe]
    proverb = Proverb.new(*chain, qualifier: 'horseshoe')

    actual = proverb.to_s
    expected = proverb.to_s
    assert_equal expected, actual
  end
end
