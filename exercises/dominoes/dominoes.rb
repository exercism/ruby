class Dominoes

  attr_reader :list

  def initialize(array)
    if(array.present?)
      array.each do |domino|
        @list << Domino.new(domino[0], domino[1]) 
      end
    else
      @list = nil
    end

  end

  # [Domino] => Bool
  def can_chain?
    result = false

    # Base case : empty list
    return @list.length.zero?# empty list

    #Base case : one domino
    result = @list.length == 1 #singletons

    result
  end
end

class Domino
  attr_accessor :normal
  attr_reader :reverse

  def initialize(left, right)
    @normal = [left, right]
    @reverse = [right, left]
  end
end