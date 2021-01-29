class Poker

  def initialize(hand_arrays)
    @hands = hand_arrays.map { |hand_array| Hand.new(hand_array) }
  end

  def best_hand
    hands.select { |hand| hand.score == highest_score }.map(&:to_a)
  end

  private

  attr_reader :hands

  def highest_score
    hands.map(&:score).max
  end

end

class Hand

  def initialize(hand_array)
    @hand_array = hand_array
    @cards = hand_array.map { |rank_and_suit| Card.new(rank_and_suit) }
  end

  def to_a
    hand_array
  end

  def score
    [hand_score, card_score].flatten
  end

  private

  attr_reader :hand_array, :cards

  def hand_score
    scoring_hands.map.with_index { |scoring_hand, i| i if scoring_hand }.compact.max
  end

  def card_score
    five_high_straight? ? [5, 4, 3, 2, 1] : card_score_array
  end

  def card_score_array
    rank_count_hash
        .sort_by { |rank, count| [-count, -rank] }
        .map { |count_rank_array| count_rank_array[0] }
  end

  def scoring_hands
    [high_card?, one_pair?, two_pair?, three_of_a_kind?, five_high_straight?,
     straight?, flush?, full_house?, four_of_a_kind?, straight_flush?]
  end

  def high_card?
    rank_count_totals.max == 1
  end

  def one_pair?
    rank_count_totals.max == 2
  end

  def two_pair?
    rank_count_totals == [1, 2, 2]
  end

  def three_of_a_kind?
    rank_count_totals.max == 3
  end

  def five_high_straight?
    rank_values == [2, 3, 4, 5, 14]
  end

  def straight?
    rank_values.each_cons(2).all? { |a, b| a + 1 == b }
  end

  def flush?
    suits.uniq.count == 1
  end

  def full_house?
    rank_count_totals == [2, 3]
  end

  def four_of_a_kind?
    rank_count_totals.max == 4
  end

  def straight_flush?
    straight? && flush?
  end

  def rank_count_totals
    rank_count_hash.values.sort
  end

  def rank_count_hash
    rank_values.each_with_object(Hash.new(0)) { |value, count| count[value] += 1 }
  end

  def rank_values
    cards.map(&:rank_value).sort
  end

  def suits
    cards.map(&:suit)
  end

end

class Card

  RANK_VALUES = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6,
                 '7' => 7, '8' => 8, '9' => 9, '10' => 10,
                 'J' => 11, 'Q' => 12, 'K' => 13, 'A' => 14}

  attr_reader :rank, :suit

  def initialize(rank_and_suit)
    @rank = rank_and_suit[0..-2]
    @suit = rank_and_suit[-1]
  end

  def rank_value
    RANK_VALUES[rank]
  end

end
