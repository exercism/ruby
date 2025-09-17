module PerfectNumber
  def self.classify(number)
    raise ArgumentError, 'Classification is only possible for positive integers.' unless number > 0

    aliquot_sum = get_divisors(number).sum

    if aliquot_sum == number
      "perfect"
    else
      aliquot_sum < number ? "deficient" : 'abundant'
    end
  end

  def self.get_divisors(number)
    return [] if number == 1

    (2..Math.sqrt(number)).each_with_object [1] do |n, divisors|
      div, mod = number.divmod n
      next unless mod.zero?

      divisors << n
      divisors << div unless div == n
    end
  end
end
