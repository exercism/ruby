require 'minitest/autorun'
require_relative 'gilded_rose'

class GildedRoseTest < Minitest::Test
  def update_with(sell_in:, quality:, name:, sell_in_change: -1, quality_change: -1)
    item = Item.new(name:, sell_in:, quality:)
    GildedRose.new([item]).update!

    assert_equal sell_in + sell_in_change, item.sell_in
    assert_equal quality + quality_change, item.quality
  end

  def test_normal_item_before_sell_date
    update_with sell_in: 1, quality: 10, name: "some item"
  end

  def test_normal_item_on_sell_date
    update_with sell_in: 0, quality: 10, name: "some item", quality_change: -2
  end

  def test_normal_item_after_sell_date
    update_with sell_in: -1, quality: 10, name: "some item", quality_change: -2
  end

  def test_normal_item_of_zero_quality
    update_with sell_in: 1, quality: 0, name: "some item", quality_change: 0
  end

  def test_normal_item_near_zero_quality
    update_with sell_in: 0, quality: 1, name: "some item", quality_change: -1
  end

  def test_brie_before_sell_date
    update_with sell_in: 1, quality: 0, name: "Aged Brie", quality_change: 1
  end

  def test_brie_on_sell_date
    update_with sell_in: 0, quality: 0, name: "Aged Brie", quality_change: 2
  end

  def test_brie_after_sell_date
    update_with sell_in: -1, quality: 0, name: "Aged Brie", quality_change: 2
  end

  def test_brie_of_max_quality
    update_with sell_in: 1, quality: 50, name: "Aged Brie", quality_change: 0
  end

  def test_brie_near_max_quality
    update_with sell_in: 0, quality: 49, name: "Aged Brie", quality_change: 1
  end

  def test_sulfuras_before_sell_date
    update_with sell_in: 1, quality: 80, name: "Sulfuras, Hand of Ragnaros",
      sell_in_change: 0, quality_change: 0
  end

  def test_sulfuras_on_sell_date
    update_with sell_in: 0, quality: 80, name: "Sulfuras, Hand of Ragnaros",
      sell_in_change: 0, quality_change: 0
  end

  def test_sulfuras_after_sell_date
    update_with sell_in: -1, quality: 80, name: "Sulfuras, Hand of Ragnaros",
      sell_in_change: 0, quality_change: 0
  end

  def test_backstage_pass_far_from_sell_date
    update_with sell_in: 11, quality: 10, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 1
  end

  def test_backstage_pass_medium_from_sell_date_upper_bound
    update_with sell_in: 10, quality: 0, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 2
  end

  def test_backstage_pass_medium_from_sell_date_lower_bound
    update_with sell_in: 6, quality: 0, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 2
  end

  def test_backstage_pass_close_to_sell_date_upper_bound
    update_with sell_in: 5, quality: 0, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 3
  end

  def test_backstage_pass_close_to_sell_date_lower_bound
    update_with sell_in: 1, quality: 0, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 3
  end

  def test_backstage_pass_on_sell_date
    update_with sell_in: 0, quality: 10, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: -10
  end

  def test_backstage_pass_after_sell_date
    update_with sell_in: -1, quality: 10, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: -10
  end

  def test_backstage_pass_of_max_quality
    update_with sell_in: 11, quality: 50, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 0
  end

  def test_backstage_pass_near_max_quality
    update_with sell_in: 1, quality: 49, name: "Backstage passes to a TAFKAL80ETC concert",
      quality_change: 1
  end

  def test_conjured_normal_item_before_sell_date
    update_with sell_in: 1, quality: 10, name: "Conjured Rabbit",
      quality_change: -2
  end

  def test_conjured_normal_item_on_sell_date
    update_with sell_in: 0, quality: 10, name: "Conjured Rabbit",
      quality_change: -10
  end

  def test_conjured_normal_item_after_sell_date
    update_with sell_in: -1, quality: 10, name: "Conjured Rabbit",
      quality_change: -10
  end

  def test_conjured_normal_item_of_zero_quality
    update_with sell_in: 1, quality: 0, name: "Conjured Rabbit",
      quality_change: 0
  end

  def test_conjured_normal_item_near_zero_quality
    update_with sell_in: 1, quality: 1, name: "Conjured Rabbit",
      quality_change: -1
  end

  def test_conjured_brie_before_sell_date
    update_with sell_in: 1, quality: 0, name: "Conjured Aged Brie",
      quality_change: 1
  end

  def test_conjured_brie_on_sell_date
    update_with sell_in: 0, quality: 10, name: "Conjured Aged Brie",
      quality_change: -10
  end

  def test_conjured_brie_after_sell_date
    update_with sell_in: -1, quality: 10, name: "Conjured Aged Brie",
      quality_change: -10
  end

  def test_conjured_brie_of_max_quality
    update_with sell_in: 1, quality: 50, name: "Conjured Aged Brie",
      quality_change: 0
  end

  def test_conjured_brie_of_zero_quality
    update_with sell_in: 0, quality: 0, name: "Conjured Aged Brie",
      quality_change: 0
  end

  def test_conjured_brie_near_zero_quality
    update_with sell_in: 0, quality: 1, name: "Conjured Aged Brie",
      quality_change: -1
  end

  def test_conjured_sulfuras_before_sell_date
    update_with sell_in: 1, quality: 80, name: "Conjured Sulfuras, Hand of Ragnaros",
      quality_change: 0
  end

  def test_conjured_sulfuras_on_sell_date
    update_with sell_in: 0, quality: 80, name: "Conjured Sulfuras, Hand of Ragnaros",
      quality_change: -80
  end

  def test_conjured_sulfuras_after_sell_date
    update_with sell_in: -1, quality: 80, name: "Conjured Sulfuras, Hand of Ragnaros",
      quality_change: -80
  end

  def test_conjured_sulfuras_of_zero_quality
    update_with sell_in: 0, quality: 0, name: "Conjured Sulfuras, Hand of Ragnaros",
      quality_change: 0
  end

  def test_conjured_sulfuras_near_zero_quality
    update_with sell_in: 0, quality: 1, name: "Conjured Sulfuras, Hand of Ragnaros",
      quality_change: -1
  end

  def test_conjured_backstage_pass_far_from_sell_date
    update_with sell_in: 11, quality: 10, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 0
  end

  def test_conjured_backstage_pass_medium_from_sell_date_upper_bound
    update_with sell_in: 10, quality: 0, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 1
  end

  def test_conjured_backstage_pass_medium_from_sell_date_lower_bound
    update_with sell_in: 6, quality: 0, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 1
  end

  def test_conjured_backstage_pass_close_to_sell_date_upper_bound
    update_with sell_in: 5, quality: 0, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 2
  end

  def test_conjured_backstage_pass_close_to_sell_date_lower_bound
    update_with sell_in: 1, quality: 0, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 2
  end

  def test_conjured_backstage_pass_on_sell_date
    update_with sell_in: 0, quality: 10, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: -10
  end

  def test_conjured_backstage_pass_after_sell_date
    update_with sell_in: -1, quality: 10, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: -10
  end

  def test_conjured_backstage_pass_of_max_quality
    update_with sell_in: 10, quality: 50, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 0
  end

  def test_conjured_backstage_pass_near_max_quality
    update_with sell_in: 1, quality: 49, name: "Conjured backstage passes to a TAFKAL80ETC concert",
      quality_change: 1
  end

  def test_multiple_items
    normal_item = Item.new(name: "some item", sell_in: 1, quality: 10)
    aged_brie = Item.new(name: "Aged Brie", sell_in: -1, quality: 10)

    GildedRose.new([normal_item, aged_brie]).update!

    assert_equal 9, normal_item.quality
    assert_equal 0, normal_item.sell_in
    assert_equal 12, aged_brie.quality
    assert_equal(-2, aged_brie.sell_in)
  end
end
