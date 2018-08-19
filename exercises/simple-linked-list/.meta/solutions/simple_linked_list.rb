class Element
  attr_reader :datum
  attr_accessor :next
  def initialize(value)
    @datum = value
    @next  = nil
  end
end

class SimpleLinkedList
  def initialize(array = [])
    create_from_array(array)
  end

  def to_a
    result = []
    pointer = @head
    while pointer
      result << pointer.datum
      pointer = pointer.next
    end
    result
  end

  def push(element)
    element.next = @head unless @head.nil?
    @head = element
    self
  end

  def pop
    element = @head
    @head = element.next if element
    element
  end

  def reverse!
    previous = nil
    pointer = @head
    while pointer
      temp = pointer.next
      pointer.next = previous
      previous = pointer
      pointer = temp
    end
    @head = previous
    self
  end

  private

  def create_from_array(array)
    array.each { |value| push(Element.new(value)) }
  end
end
