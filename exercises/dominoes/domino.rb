class Domino
  attr_reader :left, :right

  def self.deep_copy(domino)
    Domino.new(domino.left, domino.right)
  end

  def initialize(left, right)
    @left = left
    @right = right
  end

  def double?
    left == right
  end
end