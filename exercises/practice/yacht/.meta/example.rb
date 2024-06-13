class Yacht
  attr_reader :dice, :category

  def initialize(dice, category)
    @dice = dice.sort
    @category = category
  end

  def score
    case category
    when 'ones' then count_occurances(1)
    when 'twos' then count_occurances(2) * 2
    when 'threes' then count_occurances(3) * 3
    when 'fours' then count_occurances(4) * 4
    when 'fives' then count_occurances(5) * 5
    when 'sixes' then count_occurances(6) * 6
    when 'yacht' then yacht
    when 'full house' then full_house
    when 'four of a kind' then four_of_a_kind
    when 'little straight' then little_straight
    when 'big straight' then big_straight
    else choice
    end
  end

  private
  def count_occurances(number)
    dice.tally({})[number] || 0
  end

  def yacht
    yacht? ? 50 : 0
  end

  def full_house
    full_house? ? dice.sum : 0
  end

  def four_of_a_kind
    return 0 unless four_of_a_kind?

    dice.tally({}).select { |_, v| v >= 4 }.keys.first * 4
  end

  def little_straight
    little_straight? ? 30 : 0
  end

  def big_straight
    big_straight? ? 30 : 0
  end

  def choice
    dice.sum
  end

  def yacht?
    dice.uniq.length == 1
  end

  def full_house?
    dice.uniq.length == 2 && !four_of_a_kind?
  end

  def four_of_a_kind?
    dice.uniq.length <= 2 && (dice.slice(0..4).uniq.length == 1 || dice.slice(1..-1).uniq.length == 1)
  end

  def little_straight?
    dice.eql?([1, 2, 3, 4, 5])
  end

  def big_straight?
    dice.eql?([2, 3, 4, 5, 6])
  end
end
