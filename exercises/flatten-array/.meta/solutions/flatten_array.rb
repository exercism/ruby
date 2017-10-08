module BookKeeping
  VERSION = 1
end

class FlattenArray
  def self.flatten(arr)
    arr.flatten.compact
  end
end
