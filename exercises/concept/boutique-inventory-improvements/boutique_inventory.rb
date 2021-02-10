class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items

    raise NotImplementError "Refactor this code so that items have methods"
  end

  def item_names
    items.map { |item| item[:name] }.sort
    raise NotImplementError "Refactor the code in item_names"
  end

  def total_stock
    items.sum do |item|
      item[:quantity_by_size].sum { |_, quantity| quantity }
    end

    raise NotImplementError "Refactor the code in total_stock"
  end
end
