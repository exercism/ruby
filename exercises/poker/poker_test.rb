#!/usr/bin/env ruby
gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'
require_relative 'poker'

class PokerTest < Minitest::Test
  def test_one_hand
    # skip
    high_of_jack = %w(4S 5S 7H 8D JC)
    game = Poker.new([high_of_jack])
    assert_equal [high_of_jack], game.best_hand
  end

  def test_highest_card
    skip
    high_of_8 = %w(4S 5H 6S 8D 2H)
    high_of_queen = %w(2S 4H 6S 9D QH)
    game = Poker.new([high_of_8, high_of_queen])
    assert_equal [high_of_queen], game.best_hand
  end

  def test_nothing_vs_one_pair
    skip
    high_of_king = %w(4S 5H 6S 8D KH)
    pair_of_4 = %w(2S 4H 6S 4D JH)
    game = Poker.new([high_of_king, pair_of_4])
    assert_equal [pair_of_4], game.best_hand
  end

  def test_two_pair
    skip
    pair_of_2 = %w(4S 2H 6S 2D JH)
    pair_of_4 = %w(2S 4H 6S 4D JH)
    game = Poker.new([pair_of_2, pair_of_4])
    assert_equal [pair_of_4], game.best_hand
  end

  def test_one_pair_vs_double_pair
    skip
    pair_of_8 = %w(2S 8H 6S 8D JH)
    double_pair = %w(4S 5H 4S 8D 5H)
    game = Poker.new([pair_of_8, double_pair])
    assert_equal [double_pair], game.best_hand
  end

  def test_two_double_pair
    skip
    double_pair_2_and_8 = %w(2S 8H 2S 8D JH)
    double_pair_4_and_5 = %w(4S 5H 4S 8D 5H)
    game = Poker.new([double_pair_2_and_8, double_pair_4_and_5])
    assert_equal [double_pair_2_and_8], game.best_hand
  end

  def test_double_pair_vs_three
    skip
    double_pair_2_and_8 = %w(2S 8H 2S 8D JH)
    three_of_4 = %w(4S 5H 4S 8D 4H)
    game = Poker.new([double_pair_2_and_8, three_of_4])
    assert_equal [three_of_4], game.best_hand
  end

  def test_two_three
    skip
    three_of_2 = %w(2S 2H 2S 8D JH)
    three_of_1 = %w(4S AH AS 8D AH)
    game = Poker.new([three_of_2, three_of_1])
    assert_equal [three_of_1], game.best_hand
  end

  def test_three_vs_straight
    skip
    three_of_4 = %w(4S 5H 4S 8D 4H)
    straight = %w(3S 4H 2S 6D 5H)
    game = Poker.new([three_of_4, straight])
    assert_equal [straight], game.best_hand
  end

  def test_an_ace_high_straight
    skip
    three_of_4 = %w(4S 5H 4S 8D 4H)
    straight_to_5 = %w(4S AH 3S 2D 5H)
    game = Poker.new([three_of_4, straight_to_5])
    assert_equal [straight_to_5], game.best_hand
  end

  def test_two_straights
    skip
    straight_to_8 = %w(4S 6H 7S 8D 5H)
    straight_to_9 = %w(5S 7H 8S 9D 6H)
    game = Poker.new([straight_to_8, straight_to_9])
    assert_equal [straight_to_9], game.best_hand
  end

  def test_straight_vs_flush
    skip
    straight_to_8 = %w(4S 6H 7S 8D 5H)
    flush_to_7 = %w(2S 4S 5S 6S 7S)
    game = Poker.new([straight_to_8, flush_to_7])
    assert_equal [flush_to_7], game.best_hand
  end

  def test_two_flushes
    skip
    flush_to_8 = %w(3H 6H 7H 8H 5H)
    flush_to_7 = %w(2S 4S 5S 6S 7S)
    game = Poker.new([flush_to_8, flush_to_7])
    assert_equal [flush_to_8], game.best_hand
  end

  def test_flush_vs_full
    skip
    flush_to_8 = %w(3H 6H 7H 8H 5H)
    full = %w(4S 5H 4S 5D 4H)
    game = Poker.new([flush_to_8, full])
    assert_equal [full], game.best_hand
  end

  def test_two_fulls
    skip
    full_of_4_by_9 = %w(4H 4S 4D 9S 9D)
    full_of_5_by_8 = %w(5H 5S 5D 8S 8D)
    game = Poker.new([full_of_4_by_9, full_of_5_by_8])
    assert_equal [full_of_5_by_8], game.best_hand
  end

  def test_full_vs_square
    skip
    full = %w(4S 5H 4S 5D 4H)
    square_of_3 = %w(3S 3H 2S 3D 3H)
    game = Poker.new([square_of_3, full])
    assert_equal [square_of_3], game.best_hand
  end

  def test_two_square
    skip
    square_of_2 = %w(2S 2H 2S 8D 2H)
    square_of_5 = %w(4S 5H 5S 5D 5H)
    game = Poker.new([square_of_2, square_of_5])
    assert_equal [square_of_5], game.best_hand
  end

  def test_square_vs_straight_flush
    skip
    square_of_5 = %w(4S 5H 5S 5D 5H)
    straight_flush_to_9 = %w(5S 7S 8S 9S 6S)
    game = Poker.new([square_of_5, straight_flush_to_9])
    assert_equal [straight_flush_to_9], game.best_hand
  end

  def test_two_straight_flushes
    skip
    straight_flush_to_8 = %w(4H 6H 7H 8H 5H)
    straight_flush_to_9 = %w(5S 7S 8S 9S 6S)
    game = Poker.new([straight_flush_to_8, straight_flush_to_9])
    assert_equal [straight_flush_to_9], game.best_hand
  end

  def test_three_hand_with_tie
    skip
    spade_straight_to_9 = %w(9S 8S 7S 6S 5S)
    diamond_straight_to_9 = %w(9D 8D 7D 6D 5D)
    three_of_4 = %w(4D 4S 4H QS KS)
    hands = [spade_straight_to_9, diamond_straight_to_9, three_of_4]
    game = Poker.new(hands)
    assert_equal [spade_straight_to_9, diamond_straight_to_9], game.best_hand
  end

  def test_bookkeeping
    assert_equal 1, BookKeeping::VERSION
  end
end
