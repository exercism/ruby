class BinarySearch
  attr_reader :list

  def initialize(data)
    @list = data
  end

  def search_for(datum)
    return nil if list.empty?
    return middle if list[middle] == datum

    if list[middle] > datum
      sublist = list[0...middle]
      return nil if sublist == list
      return BinarySearch.new(sublist).search_for(datum)
    else
      sublist = list[middle..-1]
      return nil if sublist == list
      result = BinarySearch.new(sublist).search_for(datum)
      return result.nil? ? nil : result + middle
    end
  end

  def middle
    list.length / 2
  end
end
