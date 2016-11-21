module BookKeeping
  VERSION = 2
end

class Queens
  attr_reader :white, :black
  def initialize(positions = {})
    @white = positions.fetch(:white) { [0, 3] }
    @black = positions.fetch(:black) { [7, 3] }
    fail ArgumentError, "Queens cannot be placed on the same spot" if white == black
    fail ArgumentError, "Positions must be positive numbers" if (white + black).any? { |p| p < 0 }
    fail ArgumentError, "Positions must have square on board" if (white + black).any? { |p| p > 7 }
  end

  def attack?
    on_horizontal? || on_vertical? || on_diagonal?
  end

  private

  def on_horizontal?
    white[0] == black[0]
  end

  def on_vertical?
    white[1] == black[1]
  end

  def on_diagonal?
    (black[0] - white[0]).abs == (black[1] - white[1]).abs
  end
end
