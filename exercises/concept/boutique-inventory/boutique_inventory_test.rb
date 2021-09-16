require 'minitest/autorun'
require_relative 'boutique_inventory'

class BoutiqueInventoryTest < Minitest::Test
  def test_no_item_names
    assert_empty BoutiqueInventory.new([]).item_names
  end

  def test_one_item_name
    items = [
      { price: 65.00, name: "Red Brown Dress", quantity_by_size: {} }
    ]
    names = ["Red Brown Dress"]
    assert_equal names, BoutiqueInventory.new(items).item_names
  end

  def test_three_item_names
    items = [
      { price: 65.00, name: "Red Brown Dress", quantity_by_size: {} },
      { price: 50.00, name: "Red Short Skirt", quantity_by_size: {} },
      { price: 29.99, name: "Black Short Skirt", quantity_by_size: {} }
    ]
    names = ["Black Short Skirt", "Red Brown Dress", "Red Short Skirt"]
    assert_equal names, BoutiqueInventory.new(items).item_names
  end

  def test_cheap_for_no_items
    assert_empty BoutiqueInventory.new([]).cheap
  end

  def test_cheap_for_no_cheap_items
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: {} }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    items = [shoes, coat]
    assert_empty BoutiqueInventory.new(items).cheap
  end

  def test_one_cheap_item
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: {} }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    handkerchief = { price: 19.99, name: "Handkerchief", quantity_by_size: {} }
    items = [shoes, coat, handkerchief]
    assert_equal [handkerchief], BoutiqueInventory.new(items).cheap
  end

  def test_two_cheap_item
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: {} }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    handkerchief = { price: 19.99, name: "Handkerchief", quantity_by_size: {} }
    notebook = { price: 25.49, name: "Notebook", quantity_by_size: {} }
    items = [shoes, coat, handkerchief, notebook]
    assert_equal [handkerchief, notebook], BoutiqueInventory.new(items).cheap
  end

  def test_out_of_stock_for_no_items
    assert_empty BoutiqueInventory.new([]).out_of_stock
  end

  def test_out_of_stock_for_all_items
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: {} }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    items = [shoes, coat]
    assert_equal [shoes, coat], BoutiqueInventory.new(items).out_of_stock
  end

  def test_out_of_stock_for_some_items
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: { s: 1, xl: 4 } }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    handkerchief = { price: 19.99, name: "Handkerchief", quantity_by_size: {} }
    items = [shoes, coat, handkerchief]
    assert_equal [coat, handkerchief], BoutiqueInventory.new(items).out_of_stock
  end

  def test_stock_for_out_of_stock
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: {} }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    items = [shoes, coat]
    assert_empty(BoutiqueInventory.new(items).stock_for_item("Coat"))
  end

  def test_stock_for_item_for_some_in_stock
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: { s: 1, xl: 4 } }
    coat = { price: 65.00, name: "Coat", quantity_by_size: { s: 2 } }
    handkerchief = { price: 19.99, name: "Handkerchief", quantity_by_size: {} }
    items = [shoes, coat, handkerchief]
    assert_equal({ s: 1, xl: 4 }, BoutiqueInventory.new(items).stock_for_item("Shoes"))
  end

  def test_total_stock_for_no_items
    assert_equal 0, BoutiqueInventory.new([]).total_stock
  end

  def test_total_stock_for_no_stock
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: {} }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    items = [shoes, coat]
    assert_equal 0, BoutiqueInventory.new(items).total_stock
  end

  def test_total_stock_for_some_items
    shoes = { price: 30.00, name: "Shoes", quantity_by_size: { s: 1, xl: 4 } }
    coat = { price: 65.00, name: "Coat", quantity_by_size: {} }
    handkerchief = { price: 19.99, name: "Handkerchief", quantity_by_size: {} }
    items = [shoes, coat, handkerchief]
    assert_equal 5, BoutiqueInventory.new(items).total_stock
  end
end
