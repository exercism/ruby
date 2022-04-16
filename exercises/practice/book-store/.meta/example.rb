require 'set'

class BookStore

  GROUP_DISCOUNTS = [1.0, 0.95, 0.9, 0.8, 0.75]
  INDIVIDUAL_PRICE = 8

  def self.calculate_price(basket)
    return 0.00 if basket.empty?

    groups = []

    # Make the largest groups you can with the remaining books
    while !basket.empty?
      set = Set.new(basket)
      groups << set.size
      set.each{|book| basket.delete_at(basket.index(book))} # Remove books in set from basket
    end

    # Replace as many groups of 3 & 5 as possible with groups of 4 & 4
    while Set[3, 5] <= Set.new(groups)
      groups.delete_at(groups.index(3)) # Remove an instance of book 3 from groups
      groups.delete_at(groups.index(5)) # Remove an instance of book 5 from groups
      groups.push(4, 4)
    end


    groups.sum{|group| INDIVIDUAL_PRICE * group * GROUP_DISCOUNTS[group - 1]}
end
