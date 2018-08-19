module CollatzConjecture
  def self.steps(num)
    raise ArgumentError if num < 1
    n = num
    steps = 0
    until n == 1
      steps += 1
      if n.even?
        n /= 2
      else
        n = 3 * n + 1
      end
    end
    steps
  end
end
