class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    raise NotImplementedError, 'Implement the BoutiqueInventory#item_names method'
  end

  def cheap
    raise NotImplementedError, 'Implement the BoutiqueInventory#cheap method'
  end

  def out_of_stock
    raise NotImplementedError, 'Implement the BoutiqueInventory#out_of_stock method'
  end

  def stock_for_item
    raise NotImplementedError, 'Implement the BoutiqueInventory#stock_for_item method'
  end

  def total_stock
    raise NotImplementedError, 'Implement the BoutiqueInventory#total_stock method'
  end

  private
  attr_reader :items
end
