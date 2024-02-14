class SpiralMatrix
  private
  attr_reader :counter, :dx, :dy, :x, :y

  def initialize_matrix
    Array.new(size) { Array.new(size, 0) }
  end

  def generate_matrix
    while matrix_includes_zeroes?
      @matrix[y][x] = counter

      @dy, @dx = @dx, -@dy if next_step_invalid?

      @x += dx
      @y += dy

      @counter += 1
    end
  end

  def next_step_invalid?
    @y + @dy == @size ||
      (@y + @dy).negative? ||
      @x + @dx == @size ||
      (@x + @dx).negative? ||
      (@matrix[@y + @dy][@x + @dx]).positive?
  end

  def matrix_includes_zeroes?
    @matrix.any? { |row| row.any?(0) }
  end

  public
  attr_reader :size, :matrix

  def initialize(size)
    @size = size
    @matrix = initialize_matrix
    @dx = 1
    @dy = 0
    @y = 0
    @x = 0
    @counter = 1

    generate_matrix
  end
end
