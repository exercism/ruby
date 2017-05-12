class Bst
  VERSION = 1

  attr_reader :data, :left, :right
  def initialize(data)
    @data = data
    @size = 1
  end

  def insert(value)
    if value <= data
      insert_left(value)
    else
      insert_right(value)
    end

    @size += 1
  end

  def each(&block)
    return enum_for(:each) { @size } unless block_given?

    left && left.each(&block)
    yield data
    right && right.each(&block)
  end

  private

  def insert_left(value)
    if left
      left.insert(value)
    else
      @left = Bst.new(value)
    end
  end

  def insert_right(value)
    if right
      right.insert(value)
    else
      @right = Bst.new(value)
    end
  end
end
