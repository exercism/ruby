class BoutiqueInventory
  def initialize(items)
    @items = items
  end
  
  def item_names
    items.map { |item| item[:name] }.sort
  end
 
  def cheap
    items.select { |item| item[:price] < 30 }
  end
 
  def out_of_stock
    items.select do |item| 
      item[:quantity_by_size].none {|size, quantity| quanity > 0 }
    end
  end

  def stock_for_item(name)
    items.find {|i|i[:name] == name}[:quantity_by_size]
  end

  def total_stock
    items.sum do |item| 
      item[:quantity_by_size].sum {|_,quantity| quantity }

      # This would also be acceptable, but isn't explicitly 
      # taught in this exercise:
      #item[:quantity_by_size].values.sum
    end
  end


  private
  attr_reader :items
end
