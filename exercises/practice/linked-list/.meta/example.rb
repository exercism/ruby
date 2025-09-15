class Element
  attr_accessor :prev, :next
  attr_reader :datum

  def initialize(datum, next_element = nil, prev = nil)
    @datum = datum
    @next = next_element || self
    @prev = prev || self
  end
end

class Deque
  def initialize
    @front = nil
  end

  def push(value)
    if @front.nil?
      @front = Element.new(value)
    else
      back = @front.prev
      n = Element.new(value, @front, back)
      back.next = n
      @front.prev = n
    end
  end

  def unshift(value)
    push(value)
    @front = @front.prev
  end

  def pop
    @front = @front.prev
    shift
  end

  def shift
    value = @front.datum
    front = @front.next
    back = @front.prev
    if front.equal?(@front)
      @front = nil
    else
      front.prev = back
      back.next = front
      @front = front
    end
    value
  end

  def delete(value)
    return if @front.nil?

    current = @front
    loop do
      if current.datum == value
        if current.equal?(@front) && current.next.equal?(@front)
          @front = nil
        else
          current.prev.next = current.next
          current.next.prev = current.prev
          @front = current.next if current.equal?(@front)
        end
        break
      end
      current = current.next
      break if current.equal?(@front)
    end
  end

  def count
    return 0 if @front.nil?

    count = 0
    current = @front
    loop do
      count += 1
      current = current.next
      break if current.equal?(@front)
    end
    count
  end
end
