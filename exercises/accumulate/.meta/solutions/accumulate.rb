module BookKeeping
  VERSION = 1
end

class Array
  def accumulate
    result = []
    each do |e|
      result << yield(e)
    end
    result
  end
end
