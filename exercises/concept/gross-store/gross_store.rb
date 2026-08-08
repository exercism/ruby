class GrossStore
  UNITS = { 'quarter_of_a_dozen' => 3, 'half_of_a_dozen' => 6, 'dozen' => 12, 'small_gross' => 120, 'gross' => 144,
            'great_gross' => 1728 }

  attr_reader :bill

  # DO NOT MODIFY ANY OF THE CODE ABOVE THIS LINE

  def initialize
    raise 'Please implement the GrossStore#initialize method'
  end

  def add_item?(item, quantity)
    raise 'Please implement the GrossStore#add_item? method'
  end

  def remove_item?(item, quantity)
    raise 'Please implement the GrossStore#remove_item? method'
  end

  def quantity(item)
    raise 'Please implement the GrossStore#quantity method'
  end
end
