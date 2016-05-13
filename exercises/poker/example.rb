class Poker
  VERSION = 1

  def initialize(hands)
    @hands = hands
  end

  def best_hand
    best_score = @hands.map { |hand| hand_rank(hand) }.max
    @hands.select { |hand| hand_rank(hand) == best_score }
  end

  private

  def hand_rank(hand)
    hand_parser(hand)
    top_hand || low_hand
  end

  def hand_parser(hand)
    @card_ranks = hand.map { |ele| '..23456789TJQKA'.index(ele[0]) }
    @card_suits = hand.map { |ele| '.HSDC'.index(ele[1]) }
    @card_split = @card_ranks.each_with_object(Hash.new(0)) { |r, h| h[r] += 1 }
    @groups = @card_split.values.sort.reverse
  end

  def top_hand
    straight_flush || square || full || flush || straight
  end

  def low_hand
    three_of_a_kind || double_pair || pair || 0 + @card_ranks.max
  end

  def straight_flush
    800 + @card_ranks.max if straight? && flush?
  end

  def square
    700 + @card_split.key(4) if @groups == [4, 1]
  end

  def full
    600 + @card_split.key(3) if @groups == [3, 2]
  end

  def flush
    500 + @card_ranks.max if flush?
  end

  def straight
    400 + @card_ranks.max if straight?
  end

  def three_of_a_kind
    300 + @card_split.key(3) if @groups == [3, 1, 1]
  end

  def double_pair
    if @groups == [2, 2, 1]
      @card_split.delete(@card_split.key(1))
      return 200 + @card_split.max_by { |k| k }[0]
    end
  end

  def pair
    100 + @card_split.key(2) if @groups == [2, 1, 1, 1]
  end

  def straight?
    @card_ranks = [1, 2, 3, 4, 5] if @card_ranks.sort == [2, 3, 4, 5, 14]
    @card_ranks.uniq.length == 5 && @card_ranks.max - @card_ranks.min == 4
  end

  def flush?
    @card_suits.uniq.length == 1
  end
end
