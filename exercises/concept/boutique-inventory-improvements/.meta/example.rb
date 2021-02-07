require 'ostruct'

class BoutiqueInventory
  attr_reader :items

  def initialize(items)
    @items = items.map { |item| OpenStruct.new(item) }
  end
  
  def item_names
    items.map(&:name).sort
  end

  def total_stock
    items.sum do |item| 
      item.quantity_by_size.sum(&:value)
    end
  end
end
