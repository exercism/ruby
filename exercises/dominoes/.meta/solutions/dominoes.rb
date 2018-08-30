module Dominoes
  def self.chain?(dominoes)
    return dominoes if dominoes.empty?

    first = dominoes.first

    subchain = try_subchain(dominoes.drop(1), *first)
    subchain && [first] + subchain
  end

  def self.try_subchain(dominoes, chain_left, chain_right)
    return chain_left == chain_right ? [] : nil if dominoes.empty?

    dominoes.each_with_index { |domino, i|
      other_dominoes = dominoes.take(i) + dominoes.drop(i + 1)
      # Try adding the domino either flipped or unflipped.
      [domino, domino.reverse].each { |candidate|
        domino_left, domino_right = candidate
        if domino_left == chain_right
          if (subchain = try_subchain(other_dominoes, chain_left, domino_right))
            return [candidate] + subchain
          end
        end
      }
    }

    # Found no suitable chain.
    # Note that for "no chain" we have to use nil instead of [].
    # This is because [] is the valid answer for `Dominoes.chain([])`.
    # If we used [] for "no chain", then the meaning of [] is ambiguous.
    nil
  end
end
