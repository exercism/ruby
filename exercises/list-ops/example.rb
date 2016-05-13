class ListOps
  VERSION = 1
  ## Do not use the functions map, concat, count, length, etc.
  ## and other built in ruby methods to solve  these
  ##
  def self.arrays(arr)
    counter = 0
    arr.each do
      counter += 1
    end
    counter
  end

  def self.reverser(arr)
    answer = []
    until arr.empty?
      answer << arr.pop
    end
    answer
  end

  def self.concatter(arr1, arr2)
    answer = []
    arr1.each do |element|
      answer << element
    end
    arr2.each do |element|
      answer << element
    end
    answer
  end

  def self.mapper(arr)
    answer = []
    arr.each do |element|
      answer << (element + 1)
    end
    answer
  end

  def self.filterer(arr)
    answer = []
    arr.each do |element|
      if element % 2 == 1
        answer << element
      end
    end
    answer
  end

  def self.sum_reducer(arr)
    total = 0
    arr.each do |element|
      total += element
    end
    total
  end

  def self.factorial_reducer(arr)
    total = 1
    arr.each do |element|
        total = total * element
    end
    total
  end

end
