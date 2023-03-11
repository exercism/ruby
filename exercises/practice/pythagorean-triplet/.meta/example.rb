class PythagoreanTriplet
  def self.triplets_with_sum(sum)
    triplets = []
    (2..(sum / 2)).to_a.reverse.each do |c|
      a = 1
      b = sum - c - a
      while a < b
        triplets << [a, b, c] if pythagorean?(a, b, c)
        a += 1
        b -= 1
      end
    end
    triplets
  end

  def self.pythagorean?(a, b, c)
    (a * a + b * b == c * c)
  end
end
