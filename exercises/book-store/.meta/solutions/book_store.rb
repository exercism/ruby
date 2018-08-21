class BookStore

  GROUP_DISCOUNTS = [0, 0.05, 0.1, 0.2, 0.25]
  INDIVIDUAL_PRICE = 8

  def self.calculate_price(basket)
    groups = []
    remaining_books = basket.dup

    # Make as many groups of 4 as you can
    while (largest_group = remaining_books.uniq).length > 3
      group_of_four = largest_group[0..3]
      group_of_four.each {|book| remaining_books.delete_at(remaining_books.index(book)) }
      groups << group_of_four
    end

    # Bump as many of them to groups of 5 as you can
    groups.each do |group|
      fifth_book = (remaining_books - group).first
      next unless fifth_book

      group << fifth_book
      remaining_books.delete_at(remaining_books.index(fifth_book))
    end

    # Make the largest groups you can with the remaining books
    while (new_group = remaining_books.uniq).any?
      new_group.each {|book| remaining_books.delete_at(remaining_books.index(book)) }
      groups << new_group
    end

    groups.map {|group| group_price(group.length) }.inject(0,:+)
  end

  private

  def self.group_price(group_size)
    discount = GROUP_DISCOUNTS[group_size - 1]

    group_size * INDIVIDUAL_PRICE * (1 - discount)
  end

end
