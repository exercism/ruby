class Domino
  attr_reader :left, :right

  def initialize(left, right)
    @left = left
    @right = right
  end

  def double?
    left == right
  end
end