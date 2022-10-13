class Series
  def initialize(series)
    @series = series
  end
  def slices(n)
    if n > @series.length || n <= 0
      raise ArgumentError
    end
    series = @series
    substrings = []
    until series.length < n
      substrings << series[0..n-1]
      series = series[1..-1]
    end
    substrings
  end
end
