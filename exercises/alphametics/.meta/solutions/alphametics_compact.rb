class Alphametics
  def self.solve(input)
    input.upcase!
    keys = input.gsub(/[^A-Z]/,"").chars.to_a.uniq
    words = input.scan(/[A-Z]+/)
    final_letters = words.map {|x| x.slice(-1)}
    first_letters = words.map {|x| x.slice(0)}

    uniqlast = final_letters.uniq
    uniqfirst = first_letters.uniq
    firstnotlast = uniqfirst-uniqlast
    uniqrest = (keys - final_letters - first_letters).uniq
    sum_last_letter = final_letters.pop

    (0..9).to_a.permutation(uniqlast.length) do |lasts|
      table = Hash[[uniqlast, lasts].transpose]
      next if uniqfirst.any? {|first| table[first] == 0}
      next if (final_letters.map {|x| table[x]}).sum % 10 != table[sum_last_letter]
      ((1..9).to_a-table.values).permutation(firstnotlast.length) do |firsts|
        table2 = table.merge(Hash[[firstnotlast, firsts].transpose])
        ((0..9).to_a-table2.values).permutation(uniqrest.length) do |rest|
          table3 = table2.merge(Hash[[uniqrest, rest].transpose])
          expression = input.tr table3.keys.join, table3.values.map(&:to_s).join
          return table3 if eval(expression)
        end
      end
    end
    {}
  end
end
