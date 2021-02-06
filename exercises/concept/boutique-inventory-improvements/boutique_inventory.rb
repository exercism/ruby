class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    raise NotImplementError "Refactor this code so that items have methods"

    @items = items
  end
  
  def item_names
    raise NotImplementError "Refactor the code in item_names"

    items.map { |item| item[:name] }.sort
  end

  def total_stock
    raise NotImplementError "Refactor the code in total_stock"

    items.sum do |item| 
      item[:quantity_by_size].sum {|_,quantity| quantity }
    end
  end
end
