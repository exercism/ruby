class List
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def sublist?(list)
    list.array.join(',').include? @array.join(',')
  end

  def superlist?(list)
    @array.join(',').include? list.array.join(',')
  end

  def ==(list)
    @array == list.array
  end
end

module BookKeeping
  VERSION = 1
end
