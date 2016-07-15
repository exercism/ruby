class Array
  def accumulate
    return to_enum(__method__) unless block_given?
    result = []
    each do |e|
      result << yield(e)
    end
    result
  end
end
