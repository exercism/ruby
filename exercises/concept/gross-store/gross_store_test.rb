require 'minitest/autorun'
require_relative 'gross_store'

class GrossStoreTest < Minitest::Test
  def test_initialize_with_empty_bill
    gross_store = GrossStore.new

    assert_empty(gross_store.bill)
  end

  def test_no_unit
    gross_store = GrossStore.new
    result = gross_store.add_item?('pasta', '')
    refute result
    assert_empty(gross_store.bill)
  end

  def test_unknown_unit
    gross_store = GrossStore.new
    result = gross_store.add_item?('onion', 'quarter')
    refute result
    assert_empty(gross_store.bill)
  end

  def test_another_unknown_unit
    gross_store = GrossStore.new
    result = gross_store.add_item?('pasta', 'pound')
    refute result
    assert_empty(gross_store.bill)
  end

  def test_add_item_to_bill
    gross_store = GrossStore.new
    result = gross_store.add_item?('banana', 'half_of_a_dozen')
    assert result
    assert_equal({ 'banana' => 6 }, gross_store.bill)
  end

  def test_add_peas_to_bill
    gross_store = GrossStore.new
    result = gross_store.add_item?('peas', 'quarter_of_a_dozen')
    assert result
    assert_equal({ 'peas' => 3 }, gross_store.bill)
  end

  def test_add_chili_to_bill
    gross_store = GrossStore.new
    result = gross_store.add_item?('chili', 'dozen')
    assert result
    assert_equal({ 'chili' => 12 }, gross_store.bill)
  end

  def test_add_cucumber_to_bill
    gross_store = GrossStore.new
    result = gross_store.add_item?('cucumber', 'small_gross')
    assert result
    assert_equal({ 'cucumber' => 120 }, gross_store.bill)
  end

  def test_add_potato_to_bill
    gross_store = GrossStore.new
    result = gross_store.add_item?('potato', 'gross')
    assert result
    assert_equal({ 'potato' => 144 }, gross_store.bill)
  end

  def test_add_zucchini_to_bill
    gross_store = GrossStore.new
    result = gross_store.add_item?('zucchini', 'great_gross')
    assert result
    assert_equal({ 'zucchini' => 1728 }, gross_store.bill)
  end

  def test_add_multiple_items_to_bill
    gross_store = GrossStore.new
    gross_store.add_item?('peas', 'quarter_of_a_dozen')
    gross_store.add_item?('peas', 'quarter_of_a_dozen')
    gross_store.add_item?('tomato', 'half_of_a_dozen')
    gross_store.add_item?('tomato', 'quarter_of_a_dozen')
    expected_bill = {
      'peas' => 6,
      'tomato' => 9
    }
    assert_equal expected_bill, gross_store.bill
  end

  def test_remove_item_that_does_not_exist_in_bill
    gross_store = GrossStore.new
    result = gross_store.remove_item?('papaya', 'gross')
    refute result
    assert_empty(gross_store.bill)
  end

  def test_remove_item_with_invalid_measurement_unit
    gross_store = GrossStore.new
    gross_store.add_item?('peas', 'quarter_of_a_dozen')
    result = gross_store.remove_item?('peas', 'pound')
    refute result
    assert_equal({ 'peas' => 3 }, gross_store.bill)
  end

  def test_remove_item_with_another_invalid_measurement_unit
    gross_store = GrossStore.new
    gross_store.add_item?('tomato', 'half_of_a_dozen')
    result = gross_store.remove_item?('tomato', 'kilogram')
    refute result
    assert_equal({ 'tomato' => 6 }, gross_store.bill)
  end

  def test_remove_item_with_yet_another_invalid_measurement_unit
    gross_store = GrossStore.new
    gross_store.add_item?('cucumber', 'small_gross')
    result = gross_store.remove_item?('cucumber', 'stone')
    refute result
    assert_equal({ 'cucumber' => 120 }, gross_store.bill)
  end

  def test_remove_item_which_exceeds_existing_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('peas', 'quarter_of_a_dozen')
    result = gross_store.remove_item?('peas', 'half_of_a_dozen')
    refute result
    assert_equal({ 'peas' => 3 }, gross_store.bill)
  end

  def test_remove_another_item_which_exceeds_existing_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('tomato', 'half_of_a_dozen')
    result = gross_store.remove_item?('tomato', 'dozen')
    refute result
    assert_equal({ 'tomato' => 6 }, gross_store.bill)
  end

  def test_remove_multiple_items_from_bill
    gross_store = GrossStore.new
    gross_store.add_item?('chili', 'dozen')
    gross_store.add_item?('cucumber', 'small_gross')
    gross_store.add_item?('potato', 'gross')

    gross_store.remove_item?('chili', 'small_gross')
    gross_store.remove_item?('cucumber', 'gross')
    gross_store.remove_item?('potato', 'great_gross')

    expected_bill = {
      'chili' => 12,
      'cucumber' => 120,
      'potato' => 144
    }
    assert_equal expected_bill, gross_store.bill
  end

  def test_remove_items_to_zero_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('peas', 'quarter_of_a_dozen')

    result = gross_store.remove_item?('peas', 'quarter_of_a_dozen')
    assert result
    assert_empty(gross_store.bill)
  end

  def test_remove_another_item_to_zero_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('tomato', 'half_of_a_dozen')

    result = gross_store.remove_item?('tomato', 'half_of_a_dozen')
    assert result
    assert_empty(gross_store.bill)
  end

  def test_remove_multiple_items_to_zero_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('chili', 'dozen')
    gross_store.add_item?('cucumber', 'small_gross')
    gross_store.add_item?('potato', 'gross')
    gross_store.add_item?('zucchini', 'great_gross')

    gross_store.remove_item?('chili', 'dozen')
    gross_store.remove_item?('cucumber', 'small_gross')
    gross_store.remove_item?('potato', 'gross')
    gross_store.remove_item?('zucchini', 'great_gross')

    assert_empty(gross_store.bill)
  end

  def test_remove_item_to_reduce_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('chili', 'dozen')

    result = gross_store.remove_item?('chili', 'half_of_a_dozen')
    assert result
    assert_equal({ 'chili' => 6 }, gross_store.bill)
  end

  def test_remove_another_item_to_reduce_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('cucumber', 'small_gross')

    result = gross_store.remove_item?('cucumber', 'dozen')
    assert result
    assert_equal({ 'cucumber' => 108 }, gross_store.bill)
  end

  def test_remove_yet_another_item_to_reduce_quantity
    gross_store = GrossStore.new
    gross_store.add_item?('zucchini', 'gross')

    result = gross_store.remove_item?('zucchini', 'quarter_of_a_dozen')
    assert result
    assert_equal({ 'zucchini' => 141 }, gross_store.bill)
  end

  def test_get_item_that_does_not_exist_in_bill
    gross_store = GrossStore.new
    quantity = gross_store.quantity('grape')
    assert_equal 0, quantity
  end

  def test_get_item
    gross_store = GrossStore.new
    gross_store.add_item?('peas', 'quarter_of_a_dozen')
    quantity = gross_store.quantity('peas')
    assert_equal 3, quantity
  end

  def test_get_tomato
    gross_store = GrossStore.new
    gross_store.add_item?('tomato', 'half_of_a_dozen')
    quantity = gross_store.quantity('tomato')
    assert_equal 6, quantity
  end

  def test_get_chili
    gross_store = GrossStore.new
    gross_store.add_item?('chili', 'dozen')
    quantity = gross_store.quantity('chili')
    assert_equal 12, quantity
  end

  def test_get_cucumber
    gross_store = GrossStore.new
    gross_store.add_item?('cucumber', 'small_gross')
    quantity = gross_store.quantity('cucumber')
    assert_equal 120, quantity
  end

  def test_get_potato
    gross_store = GrossStore.new
    gross_store.add_item?('potato', 'gross')
    quantity = gross_store.quantity('potato')
    assert_equal 144, quantity
  end

  def test_get_zucchini
    gross_store = GrossStore.new
    gross_store.add_item?('zucchini', 'great_gross')
    quantity = gross_store.quantity('zucchini')
    assert_equal 1728, quantity
  end
end
