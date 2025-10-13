class Proverb
  attr_reader :chain, :options

  def initialize(*chain)
    @options = if chain.last.is_a? Hash
                 chain.pop
               else
                 {}
               end
    @chain = chain
  end

  def to_s
    return "" if chain.empty?
    return conclusion[1..] if chain.size <= 1

    chain_of_events + conclusion
  end

  def chain_of_events
    causes_and_effects.map do |cause, effect|
      consequence(cause, effect)
    end.join("\n")
  end

  def causes_and_effects
    chain.each_cons(2)
  end

  def consequence(cause, effect)
    format('For want of a %s the %s was lost.', cause, effect)
  end

  def qualifier
    options[:qualifier] ? '%s ' % options[:qualifier] : ''
  end

  def conclusion
    format("\nAnd all for the want of a %s%s.", qualifier, chain.first)
  end
end
