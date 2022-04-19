require 'set'

class BookStore

  ONE_MINUS_DISCOUNTS = [1.0, 0.95, 0.9, 0.8, 0.75]
  INDIVIDUAL_PRICE = 8

  def self.calculate_price(basket)
    groups = []

    # Make the largest groups you can with the books
    while (new_group = basket.uniq).any?
      new_group.each {|book| basket.delete_at(basket.index(book)) }
      groups << new_group.size
    end

    # Replace as many groups of size 3 & 5 as possible with groups of size 4 & 4
    while Set[3, 5] <= Set.new(groups)
      groups.delete_at(groups.index(3))
      groups.delete_at(groups.index(5))
      groups.push(4, 4)
    end

    groups.sum { |group| INDIVIDUAL_PRICE * group * ONE_MINUS_DISCOUNTS[group - 1] }
  end
end
