module Blackjack
  def self.parse_card(card)
    case card
    when "ace"                          then 11
    when "jack", "queen", "king", "ten" then 10
    when "nine"                         then 9
    when "eight"                        then 8
    when "seven"                        then 7
    when "six"                          then 6
    when "five"                         then 5
    when "four"                         then 4
    when "three"                        then 3
    when "two"                          then 2
    else                                     0
    end
  end

  def self.card_range(card1, card2)
    case parse_card(card1) + parse_card(card2)
    when 4..11
      "low"
    when 12..16
      "mid"
    when 17..20
      "high"
    when 21
      "blackjack"
    end
  end

  def self.first_turn(card1, card2, dealer_card)
    hand_score = parse_card(card1) + parse_card(card2)
    dealer_score = parse_card(dealer_card)

    case
    when hand_score == 22
      "P"
    when hand_score == 21
      if dealer_score < 10
        "W"
      else
        "S"
      end
    when hand_score >= 17 || hand_score >= 12 && dealer_score < 7
      "S"
    else
      "H"
    end
  end
end
