class AbstractItem
  attr_reader :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name, @sell_in, @quality = name, sell_in, quality
    @conjured = name.start_with? "Conjured"
  end

  def conjured? = @conjured

  def update
    update_quality
    @quality = 0 if quality < 0
    @quality = 0 if conjured? && sell_in <= 0
    @quality = max_quality if quality > max_quality

    update_sell_in
  end

  private

  def max_quality = 50

  def update_quality = raise NotImplementedError

  def update_sell_in = @sell_in -= 1
end

class NormalItem < AbstractItem
  def self.name_regex = /.+/ # Should be checked last, after other item types.

  private

  def update_quality
    quality_change = -1
    quality_change -= 1 if sell_in <= 0
    quality_change *= 2 if conjured?

    @quality += quality_change
  end
end

class AgedBrie < AbstractItem
  def self.name_regex = /Aged Brie/

  private

  def update_quality
    quality_change = 1
    quality_change += 1 if sell_in <= 0

    @quality += quality_change
  end
end

class Sulfuras < AbstractItem
  def self.name_regex = /Sulfuras, Hand of Ragnaros/

  private

  def max_quality = 80

  def update_quality
  end

  def update_sell_in
    @sell_in -= 1 if conjured?
  end
end

class BackstagePass < AbstractItem
  def self.name_regex = /Backstage passes to a TAFKAL80ETC concert/i

  private

  def update_quality
    @quality = 0 and return if sell_in <= 0

    quality_change = 1
    quality_change += 1 if sell_in <= 10
    quality_change += 1 if sell_in <= 5
    quality_change -= 1 if conjured?

    @quality += quality_change
  end
end

# An item factory. Not named ItemFactory only because the tests expect `Item`.
module Item
  ITEM_CLASSES = [AgedBrie, Sulfuras, BackstagePass, NormalItem]

  def self.new(name:, sell_in:, quality:)
    item_class(name).new(name:, sell_in:, quality:)
  end

  private_class_method def self.item_class(name)
    ITEM_CLASSES.find { name.match?(_1.name_regex) }
  end
end

class GildedRose
  def initialize(items)
    @items = items
  end

  def update
    @items.each do |item|
      item.update
    end
  end
end
