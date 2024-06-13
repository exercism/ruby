require 'minitest/autorun'
require_relative 'blackjack'

class BlackjackTest < Minitest::Test
  def test_parse_ace
    assert_equal 11, Blackjack.parse_card("ace")
  end

  def test_parse_two
    assert_equal 2, Blackjack.parse_card("two")
  end

  def test_parse_three
    assert_equal 3, Blackjack.parse_card("three")
  end

  def test_parse_four
    assert_equal 4, Blackjack.parse_card("four")
  end

  def test_parse_five
    assert_equal 5, Blackjack.parse_card("five")
  end

  def test_parse_six
    assert_equal 6, Blackjack.parse_card("six")
  end

  def test_parse_seven
    assert_equal 7, Blackjack.parse_card("seven")
  end

  def test_parse_eight
    assert_equal 8, Blackjack.parse_card("eight")
  end

  def test_parse_nine
    assert_equal 9, Blackjack.parse_card("nine")
  end

  def test_parse_ten
    assert_equal 10, Blackjack.parse_card("ten")
  end

  def test_parse_jack
    assert_equal 10, Blackjack.parse_card("jack")
  end

  def test_parse_queen
    assert_equal 10, Blackjack.parse_card("queen")
  end

  def test_parse_king
    assert_equal 10, Blackjack.parse_card("king")
  end

  def test_parse_unknown_card
    assert_equal 0, Blackjack.parse_card("joker")
  end

  def test_lower_low_range
    assert_equal "low", Blackjack.card_range("two", "two")
  end

  def test_mid_low_range
    assert_equal "low", Blackjack.card_range("three", "four")
  end

  def test_upper_low_range
    assert_equal "low", Blackjack.card_range("four", "seven")
  end

  def test_lower_mid_range
    assert_equal "mid", Blackjack.card_range("seven", "five")
  end

  def test_mid_mid_range
    assert_equal "mid", Blackjack.card_range("seven", "seven")
  end

  def test_upper_mid_range
    assert_equal "mid", Blackjack.card_range("nine", "seven")
  end

  def test_lower_high_range
    assert_equal "high", Blackjack.card_range("nine", "eight")
  end

  def test_mid_high_range
    assert_equal "high", Blackjack.card_range("eight", "queen")
  end

  def test_upper_high_range
    assert_equal "high", Blackjack.card_range("king", "ten")
  end

  def test_blackjack_range
    assert_equal "blackjack", Blackjack.card_range("ace", "ten")
  end

  def test_first_turn_pair_of_aces
    assert_equal "P", Blackjack.first_turn("ace", "ace", "ace")
  end

  def test_first_turn_pair_of_jacks
    assert_equal "S", Blackjack.first_turn("jack", "jack", "ace")
  end

  def test_first_turn_pair_of_queens
    assert_equal "S", Blackjack.first_turn("queen", "queen", "ace")
  end

  def test_first_turn_pair_of_twos
    assert_equal "H", Blackjack.first_turn("two", "two", "ace")
  end

  def test_first_turn_pair_of_five
    assert_equal "H", Blackjack.first_turn("five", "five", "ace")
  end

  def test_first_turn_blackjack_with_ace_for_dealer
    assert_equal "S", Blackjack.first_turn("ace", "king", "ace")
  end

  def test_first_turn_blackjack_with_queen_for_dealer
    assert_equal "S", Blackjack.first_turn("jack", "king", "queen")
  end

  def test_first_turn_blackjack_with_five_for_dealer
    assert_equal "W", Blackjack.first_turn("ace", "king", "five")
  end

  def test_first_turn_blackjack_with_nine_for_dealer
    assert_equal "W", Blackjack.first_turn("ace", "king", "nine")
  end

  def test_first_turn_score_of_20
    assert_equal "S", Blackjack.first_turn("king", "queen", "ace")
  end

  def test_first_turn_score_of_19
    assert_equal "S", Blackjack.first_turn("king", "nine", "ace")
  end

  def test_first_turn_score_of_18
    assert_equal "S", Blackjack.first_turn("queen", "eight", "ace")
  end

  def test_first_turn_score_of_17
    assert_equal "S", Blackjack.first_turn("jack", "seven", "ace")
  end

  def test_first_turn_score_of_16_with_six_for_dealer
    assert_equal "S", Blackjack.first_turn("jack", "six", "six")
  end

  def test_first_turn_score_of_16_with_seven_for_dealer
    assert_equal "H", Blackjack.first_turn("nine", "seven", "seven")
  end

  def test_first_turn_score_of_16_with_ace_for_dealer
    assert_equal "H", Blackjack.first_turn("nine", "seven", "ace")
  end

  def test_first_turn_score_of_15_with_six_for_dealer
    assert_equal "S", Blackjack.first_turn("nine", "six", "six")
  end

  def test_first_turn_score_of_15_with_seven_for_dealer
    assert_equal "H", Blackjack.first_turn("eight", "seven", "seven")
  end

  def test_first_turn_score_of_15_with_queen_for_dealer
    assert_equal "H", Blackjack.first_turn("six", "nine", "queen")
  end

  def test_first_turn_score_of_14_with_six_for_dealer
    assert_equal "S", Blackjack.first_turn("eight", "six", "six")
  end

  def test_first_turn_score_of_14_with_seven_for_dealer
    assert_equal "H", Blackjack.first_turn("seven", "seven", "seven")
  end

  def test_first_turn_score_of_14_with_queen_for_dealer
    assert_equal "H", Blackjack.first_turn("five", "nine", "queen")
  end

  def test_first_turn_score_of_13_with_six_for_dealer
    assert_equal "S", Blackjack.first_turn("seven", "six", "six")
  end

  def test_first_turn_score_of_13_with_seven_for_dealer
    assert_equal "H", Blackjack.first_turn("six", "seven", "seven")
  end

  def test_first_turn_score_of_13_with_queen_for_dealer
    assert_equal "H", Blackjack.first_turn("four", "nine", "queen")
  end

  def test_first_turn_score_of_12_with_six_for_dealer
    assert_equal "S", Blackjack.first_turn("six", "six", "six")
  end

  def test_first_turn_score_of_12_with_seven_for_dealer
    assert_equal "H", Blackjack.first_turn("five", "seven", "seven")
  end

  def test_first_turn_score_of_12_with_queen_for_dealer
    assert_equal "H", Blackjack.first_turn("three", "nine", "queen")
  end

  def test_first_turn_score_of_11_with_king_for_dealer
    assert_equal "H", Blackjack.first_turn("four", "seven", "king")
  end

  def test_first_turn_score_of_10_with_two_for_dealer
    assert_equal "H", Blackjack.first_turn("four", "six", "two")
  end

  def test_first_turn_score_of_5_with_queen_for_dealer
    assert_equal "H", Blackjack.first_turn("two", "three", "queen")
  end

  def test_first_turn_score_of_4_with_five_for_dealer
    assert_equal "H", Blackjack.first_turn("two", "two", "five")
  end
end
