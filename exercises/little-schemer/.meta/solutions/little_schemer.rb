module BookKeeping
  VERSION = 1
end

def null?(list)
  raise ArgumentError unless list.is_a? Array
  list.empty?
end

def car(list)
  raise ArgumentError if null?(list)
  list[0]
end

def cdr(list)
  raise ArgumentError if null?(list)
  list[1..-1]
end

def atom?(expression)
  expression.is_a? String or expression.is_a? Integer
end

def lat?(list)
  return true if null?(list)

  if atom?(car(list))
    lat?(cdr list)
  else
    false
  end
end
