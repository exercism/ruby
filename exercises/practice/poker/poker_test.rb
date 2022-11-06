require 'minitest/autorun'
require_relative 'poker'

class PokerTest < Minitest::Test
  def test_single_hand_always_wins
    # skip
    hands = [%w[4S 5S 7H 8D JC]]
    assert_equal [%w[4S 5S 7H 8D JC]], Poker.new(hands).best_hand
  end

  def test_highest_card_out_of_all_hands_wins
    skip
    hands = [%w[4D 5S 6S 8D 3C], %w[2S 4C 7S 9H 10H], %w[3S 4S 5D 6H JH]]
    assert_equal [%w[3S 4S 5D 6H JH]], Poker.new(hands).best_hand
  end

  def test_a_tie_has_multiple_winners
    skip
    hands = [%w[4D 5S 6S 8D 3C], %w[2S 4C 7S 9H 10H], %w[3S 4S 5D 6H JH], %w[3H 4H 5C 6C JD]]
    assert_equal [%w[3S 4S 5D 6H JH], %w[3H 4H 5C 6C JD]], Poker.new(hands).best_hand
  end

  def test_multiple_hands_with_the_same_high_cards_tie_compares_next_highest_ranked_down_to_last_card
    skip
    hands = [%w[3S 5H 6S 8D 7H], %w[2S 5D 6D 8C 7S]]
    assert_equal [%w[3S 5H 6S 8D 7H]], Poker.new(hands).best_hand
  end

  def test_one_pair_beats_high_card
    skip
    hands = [%w[4S 5H 6C 8D KH], %w[2S 4H 6S 4D JH]]
    assert_equal [%w[2S 4H 6S 4D JH]], Poker.new(hands).best_hand
  end

  def test_highest_pair_wins
    skip
    hands = [%w[4S 2H 6S 2D JH], %w[2S 4H 6C 4D JD]]
    assert_equal [%w[2S 4H 6C 4D JD]], Poker.new(hands).best_hand
  end

  def test_two_pairs_beats_one_pair
    skip
    hands = [%w[2S 8H 6S 8D JH], %w[4S 5H 4C 8C 5C]]
    assert_equal [%w[4S 5H 4C 8C 5C]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_two_pairs_highest_ranked_pair_wins
    skip
    hands = [%w[2S 8H 2D 8D 3H], %w[4S 5H 4C 8S 5D]]
    assert_equal [%w[2S 8H 2D 8D 3H]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_two_pairs_with_the_same_highest_ranked_pair_tie_goes_to_low_pair
    skip
    hands = [%w[2S QS 2C QD JH], %w[JD QH JS 8D QC]]
    assert_equal [%w[JD QH JS 8D QC]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_two_identically_ranked_pairs_tie_goes_to_remaining_card_kicker
    skip
    hands = [%w[JD QH JS 8D QC], %w[JS QS JC 2D QD]]
    assert_equal [%w[JD QH JS 8D QC]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_two_pairs_that_add_to_the_same_value_win_goes_to_highest_pair
    skip
    hands = [%w[6S 6H 3S 3H AS], %w[7H 7S 2H 2S AC]]
    assert_equal [%w[7H 7S 2H 2S AC]], Poker.new(hands).best_hand
  end

  def test_two_pairs_first_ranked_by_largest_pair
    skip
    hands = [%w[5C 2S 5S 4H 4C], %w[6S 2S 6H 7C 2C]]
    assert_equal [%w[6S 2S 6H 7C 2C]], Poker.new(hands).best_hand
  end

  def test_three_of_a_kind_beats_two_pair
    skip
    hands = [%w[2S 8H 2H 8D JH], %w[4S 5H 4C 8S 4H]]
    assert_equal [%w[4S 5H 4C 8S 4H]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_three_of_a_kind_tie_goes_to_highest_ranked_triplet
    skip
    hands = [%w[2S 2H 2C 8D JH], %w[4S AH AS 8C AD]]
    assert_equal [%w[4S AH AS 8C AD]], Poker.new(hands).best_hand
  end

  def test_with_multiple_decks_two_players_can_have_same_three_of_a_kind_ties_go_to_highest_remaining_cards
    skip
    hands = [%w[4S AH AS 7C AD], %w[4S AH AS 8C AD]]
    assert_equal [%w[4S AH AS 8C AD]], Poker.new(hands).best_hand
  end

  def test_a_straight_beats_three_of_a_kind
    skip
    hands = [%w[4S 5H 4C 8D 4H], %w[3S 4D 2S 6D 5C]]
    assert_equal [%w[3S 4D 2S 6D 5C]], Poker.new(hands).best_hand
  end

  def test_aces_can_end_a_straight_10_j_q_k_a
    skip
    hands = [%w[4S 5H 4C 8D 4H], %w[10D JH QS KD AC]]
    assert_equal [%w[10D JH QS KD AC]], Poker.new(hands).best_hand
  end

  def test_aces_can_start_a_straight_a_2_3_4_5
    skip
    hands = [%w[4S 5H 4C 8D 4H], %w[4D AH 3S 2D 5C]]
    assert_equal [%w[4D AH 3S 2D 5C]], Poker.new(hands).best_hand
  end

  def test_aces_cannot_be_in_the_middle_of_a_straight_q_k_a_2_3
    skip
    hands = [%w[2C 3D 7H 5H 2S], %w[QS KH AC 2D 3S]]
    assert_equal [%w[2C 3D 7H 5H 2S]], Poker.new(hands).best_hand
  end

  def test_both_hands_with_a_straight_tie_goes_to_highest_ranked_card
    skip
    hands = [%w[4S 6C 7S 8D 5H], %w[5S 7H 8S 9D 6H]]
    assert_equal [%w[5S 7H 8S 9D 6H]], Poker.new(hands).best_hand
  end

  def test_even_though_an_ace_is_usually_high_a_5_high_straight_is_the_lowest_scoring_straight
    skip
    hands = [%w[2H 3C 4D 5D 6H], %w[4S AH 3S 2D 5H]]
    assert_equal [%w[2H 3C 4D 5D 6H]], Poker.new(hands).best_hand
  end

  def test_flush_beats_a_straight
    skip
    hands = [%w[4C 6H 7D 8D 5H], %w[2S 4S 5S 6S 7S]]
    assert_equal [%w[2S 4S 5S 6S 7S]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_a_flush_tie_goes_to_high_card_down_to_the_last_one_if_necessary
    skip
    hands = [%w[4H 7H 8H 9H 6H], %w[2S 4S 5S 6S 7S]]
    assert_equal [%w[4H 7H 8H 9H 6H]], Poker.new(hands).best_hand
  end

  def test_full_house_beats_a_flush
    skip
    hands = [%w[3H 6H 7H 8H 5H], %w[4S 5H 4C 5D 4H]]
    assert_equal [%w[4S 5H 4C 5D 4H]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_a_full_house_tie_goes_to_highest_ranked_triplet
    skip
    hands = [%w[4H 4S 4D 9S 9D], %w[5H 5S 5D 8S 8D]]
    assert_equal [%w[5H 5S 5D 8S 8D]], Poker.new(hands).best_hand
  end

  def test_with_multiple_decks_both_hands_have_a_full_house_with_the_same_triplet_tie_goes_to_the_pair
    skip
    hands = [%w[5H 5S 5D 9S 9D], %w[5H 5S 5D 8S 8D]]
    assert_equal [%w[5H 5S 5D 9S 9D]], Poker.new(hands).best_hand
  end

  def test_four_of_a_kind_beats_a_full_house
    skip
    hands = [%w[4S 5H 4D 5D 4H], %w[3S 3H 2S 3D 3C]]
    assert_equal [%w[3S 3H 2S 3D 3C]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_four_of_a_kind_tie_goes_to_high_quad
    skip
    hands = [%w[2S 2H 2C 8D 2D], %w[4S 5H 5S 5D 5C]]
    assert_equal [%w[4S 5H 5S 5D 5C]], Poker.new(hands).best_hand
  end

  def test_with_multiple_decks_both_hands_with_identical_four_of_a_kind_tie_determined_by_kicker
    skip
    hands = [%w[3S 3H 2S 3D 3C], %w[3S 3H 4S 3D 3C]]
    assert_equal [%w[3S 3H 4S 3D 3C]], Poker.new(hands).best_hand
  end

  def test_straight_flush_beats_four_of_a_kind
    skip
    hands = [%w[4S 5H 5S 5D 5C], %w[7S 8S 9S 6S 10S]]
    assert_equal [%w[7S 8S 9S 6S 10S]], Poker.new(hands).best_hand
  end

  def test_aces_can_end_a_straight_flush_10_j_q_k_a
    skip
    hands = [%w[KC AH AS AD AC], %w[10C JC QC KC AC]]
    assert_equal [%w[10C JC QC KC AC]], Poker.new(hands).best_hand
  end

  def test_aces_can_start_a_straight_flush_a_2_3_4_5
    skip
    hands = [%w[KS AH AS AD AC], %w[4H AH 3H 2H 5H]]
    assert_equal [%w[4H AH 3H 2H 5H]], Poker.new(hands).best_hand
  end

  def test_aces_cannot_be_in_the_middle_of_a_straight_flush_q_k_a_2_3
    skip
    hands = [%w[2C AC QC 10C KC], %w[QH KH AH 2H 3H]]
    assert_equal [%w[2C AC QC 10C KC]], Poker.new(hands).best_hand
  end

  def test_both_hands_have_a_straight_flush_tie_goes_to_highest_ranked_card
    skip
    hands = [%w[4H 6H 7H 8H 5H], %w[5S 7S 8S 9S 6S]]
    assert_equal [%w[5S 7S 8S 9S 6S]], Poker.new(hands).best_hand
  end

  def test_even_though_an_ace_is_usually_high_a_5_high_straight_flush_is_the_lowest_scoring_straight_flush
    skip
    hands = [%w[2H 3H 4H 5H 6H], %w[4D AD 3D 2D 5D]]
    assert_equal [%w[2H 3H 4H 5H 6H]], Poker.new(hands).best_hand
  end
end
