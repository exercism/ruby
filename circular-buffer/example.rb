class CircularBuffer
  
  def initialize(capacity)
    @capacity = capacity
    @write_point = @read_point = 0
    @buffer = Array.new(capacity, nil)
  end
  
  def write data
    update_buffer(data) do
      raise BufferFullException if full?
      @buffer[@write_point] = data
    end
  end
  
  def write! data
    update_buffer(data) do
      @buffer[@write_point] = data
      if overwriting?
        update_read_point
      end
    end
  end
    
  def read
    raise BufferEmptyException if empty?
    data = @buffer[@read_point]
    @buffer[@read_point] = nil
    update_read_point
    data
  end
  
  def clear
    @buffer = Array.new(@capacity)
  end
  
  private
    
  def update_buffer item
    return if item.nil?
    yield if block_given?
    update_write_point
  end
  
  def update_read_point
    @read_point = (@read_point + 1) % @capacity
  end
  
  def update_write_point
    @write_point = (@write_point + 1) % @capacity
  end
  
  def overwriting?
    (full? && @write_point == @read_point)
  end
  
  def empty?
    @buffer.compact.empty?
  end
  
  def full?
    @buffer.all?
  end
  
  class BufferFullException < Exception; end
    
  class BufferEmptyException < Exception; end
  
end