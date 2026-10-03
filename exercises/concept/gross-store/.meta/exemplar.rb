class GrossStore
  UNITS = { 'quarter_of_a_dozen' => 3, 'half_of_a_dozen' => 6, 'dozen' => 12, 'small_gross' => 120, 'gross' => 144,
            'great_gross' => 1728 }

  attr_reader :bill

  # DO NOT MODIFY ANY OF THE CODE ABOVE THIS LINE

  def initialize
    # Initialize an empty bill as a hash
    @bill = {}
  end

  def add_item?(item, quantity)
    # Add the specified quantity of the item to the bill
    return false unless UNITS.key?(quantity)

    @bill[item] ||= 0
    @bill[item] += UNITS[quantity]
    true
  end

  def remove_item?(item, quantity)
    # Remove the specified quantity of the item from the bill
    return false unless UNITS.key?(quantity)
    return false unless @bill.key?(item)
    return false if @bill[item] < UNITS[quantity]

    @bill[item] -= UNITS[quantity]
    @bill.delete(item) if @bill[item].zero?
    true
  end

  def quantity(item)
    # Return the quantity of the specified item in the bill
    @bill.fetch(item, 0)
  end
end
