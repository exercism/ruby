class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    raise 'Implement the BoutiqueInventory#item_names method'
  end

  def cheap
    raise 'Implement the BoutiqueInventory#cheap method'
  end

  def out_of_stock
    raise 'Implement the BoutiqueInventory#out_of_stock method'
  end

  def stock_for_item(name)
    raise 'Implement the BoutiqueInventory#stock_for_item method'
  end

  def total_stock
    raise 'Implement the BoutiqueInventory#total_stock method'
  end

  private
  attr_reader :items
end
