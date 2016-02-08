class Element
  attr_reader   :datum
  attr_accessor :next

  def initialize(datum, next_element=nil)
    @datum = datum
    @next  = next_element
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size
  attr_reader :head

  def initialize
    @head = nil
    @size = 0
  end

  def push(datum)
    e = Element.new(datum, @head)
    @head = e
    @size += 1
  end

  def empty?
    @size.zero?
  end

  def peek
    @head.nil? ? nil : @head.datum
  end

  def pop
    e, @head = @head, @head.next
    @size -= 1
    return e.datum
  end

  def each
    return enum_for(:each) unless block_given?
    current = head
    until current.nil?
      yield current.datum
      current = current.next
    end
  end

  def to_a
    each.to_a
  end

  def reverse
    each.with_object(SimpleLinkedList.new) { |datum, list| list.push(datum) }
  end

  def self.from_a(a)
    new.tap do |list|
      a.to_a.reverse_each do |item|
        list.push(item)
      end
    end
  end
end
