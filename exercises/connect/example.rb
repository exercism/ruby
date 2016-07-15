Position = Struct.new(:x, :y)
class Board
  DIRECTIONS = [[1, 0], [-1, 0], [0, 1], [0, -1], [-1, 1], [1, -1]].freeze
  NOTHING = nil
  BLACK = 'X'.freeze
  WHITE = 'O'.freeze

  def initialize(game)
    @fields = Array.new(game.length) { Array.new(cols(game[0]).size) }
    prepare_board(game)
    @history = {}
    @height = @fields.length
    @width = @fields[0].length
  end

  def cols(line)
    line.tr(' ', '').split('')
  end

  def prepare_board(game)
    game.each_with_index do |line, y|
      cols(line).each_with_index do |char, x|
        @fields[x][y] =
          if char == BLACK || char == WHITE
            char
          else NOTHING
          end
      end
    end
  end

  def start_of(winner)
    case winner
    when BLACK then (0..(@width - 1)).map { |x| Position.new(x, 0) }
    when WHITE then (0..(@height - 1)).map { |y| Position.new(0, y) }
    end
  end

  def winner?(winner)
    start_of(winner).each do |position|
      return true if winner_on?(position, winner)
    end
    false
  end

  def neighbours(pos)
    neighbours = []
    DIRECTIONS.each do |x, y|
      position = Position.new pos.x + x, pos.y + y
      neighbours << position if into_board? position
    end
    neighbours
  end

  def into_board?(position)
    position.x >= 0 && position.y >= 0 &&
      position.x < @width && position.y < @height
  end

  def target_of?(winner, position)
    case winner
    when BLACK then position.x == @width - 1
    when WHITE then position.y == @height - 1
    else
      false
    end
  end

  def reach_target?(winner, position)
    (winner == BLACK && position.x == @width - 1) ||
      (winner == WHITE && position.y == @height - 1)
  end

  def winner_on?(position, winner)
    x = position.x
    y = position.y
    if @fields[x][y] == winner
      return if @history[[winner, x, y]]
      @history[[winner, x, y]] = true
      return true if reach_target? winner, position
      neighbours(position).each do |pos|
        return true if winner_on? pos, winner
      end
    end
  end

  def winner
    return 'black' if winner? BLACK
    return 'white' if winner? WHITE
    ''
  end

  def each_field
    (0...@height).each do |y|
      (0...@width).each do |x|
        yield @fields[x][y], x, y
      end
    end
  end

  def dump
    each_field do |chr, x, y|
      if chr == BLACK || chr == WHITE
        chr = chr.downcase if @history[[chr, x, y]]
        print chr + ' '
      else
        print '. '
      end
      print "\n" if x == @width - 1
    end
  end
end
