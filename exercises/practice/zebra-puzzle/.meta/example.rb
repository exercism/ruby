CATEGORIES = {
  color: %i[
    red
    green
    blue
    yellow
    ivory
  ].freeze,
  nationality: %i[
    englishman
    spaniard
    ukrainian
    norwegian
    japanese
  ].freeze,
  beverage: %i[
    coffee
    tea
    milk
    orange_juice
    water
  ].freeze,
  cigarette: %i[
    old_gold
    kool
    chesterfield
    lucky_strike
    parliament
  ].freeze,
  pet: %i[
    dog
    snails
    fox
    horse
    zebra
  ].freeze
}.freeze

House = Data.define(*CATEGORIES.keys)

module ZebraPuzzle
  def self.water_drinker
    houses.find { _1.beverage == :water }.nationality.to_s.capitalize
  end

  def self.zebra_owner
    houses.find { _1.pet == :zebra }.nationality.to_s.capitalize
  end

  private_class_method def self.houses
    @houses ||= ZebraPuzzleSolver.new.final_row_of_houses
  end
end

class ZebraPuzzleSolver
  def initialize
    @table = null_table
  end

  def final_row_of_houses
    return @table unless @table == null_table

    CATEGORIES.each_key do |key|
      add_into_table!(key)
      send("filter_by_#{key}!")
    end

    raise "More than one final possibility exists" if @table.count > 1

    @table.first
  end

  private
  def null_table
    null_house = CATEGORIES.keys.to_h { |key| [key, nil] }

    # Clue: There are five houses.
    [[null_house] * 5]
  end

  def add_into_table!(new_key)
    permutations = CATEGORIES.fetch(new_key).permutation

    @table.map! do |houses|
      permutations.map do |new_values|
        houses.zip(new_values).map do |house, new_value|
          House.new(**house.to_h.merge(new_key => new_value))
        end
      end
    end.flatten!(1)
  end

  def filter_by_color!
    @table.select! do |houses|
      # Clue: The green house is immediately to the right of the ivory house.
      houses.index { _1.color == :green } == houses.index { _1.color == :ivory } + 1 &&
        # (Clue: The second house is blue. From these clues:)
        #   - The Norwegian lives in the first house.
        #   - The Norwegian lives next to the blue house.
        houses.index { _1.color == :blue } == 1
    end
  end

  def filter_by_nationality!
    @table.select! do |houses|
      # Clue: The Englishman lives in the red house.
      houses.any? { _1.nationality == :englishman && _1.color == :red } &&
        # Clue: The Norwegian lives in the first house.
        houses.first.nationality == :norwegian
    end
  end

  def filter_by_beverage!
    @table.select! do |houses|
      # Clue: Coffee is drunk in the green house.
      houses.any? { _1.beverage == :coffee && _1.color == :green } &&
        # Clue: The Ukrainian drinks tea.
        houses.any? { _1.nationality == :ukrainian && _1.beverage == :tea } &&
        # Clue: Milk is drunk in the middle house.
        houses[2].beverage == :milk
    end
  end

  def filter_by_cigarette!
    @table.select! do |houses|
      # Clue: Kools are smoked in the yellow house.
      houses.any? { _1.cigarette == :kool && _1.color == :yellow } &&
        # Clue: The Lucky Strike smoker drinks orange juice.
        houses.any? { _1.cigarette == :lucky_strike && _1.beverage == :orange_juice } &&
        # Clue: The Japanese smokes Parliaments.
        houses.any? { _1.nationality == :japanese && _1.cigarette == :parliament }
    end
  end

  # rubocop:disable Metrics/AbcSize

  def filter_by_pet!
    @table.select! do |houses|
      # Clue: The Spaniard owns the dog.
      houses.any? { _1.nationality == :spaniard && _1.pet == :dog } &&
        # Clue: The Old Gold smoker owns snails.
        houses.any? { _1.cigarette == :old_gold && _1.pet == :snails } &&
        # Clue: The man who smokes Chesterfields lives in the house next to the man with the fox.
        (houses.index { _1.cigarette == :chesterfield } - houses.index { _1.pet == :fox }).abs == 1 &&
        # Clue: Kools are smoked in the house next to the house where the horse is kept.
        (houses.index { _1.cigarette == :kool } - houses.index { _1.pet == :horse }).abs == 1
    end
  end
  # rubocop:enable Metrics/AbcSize
end
