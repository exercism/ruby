class PerfectNumber
  def self.classify(num)
    raise 'not a natural number' if num < 0
    aliquot_sum = aliquot_sum(num)
    aliquot_sum == num ? "perfect" : aliquot_sum < num ? "deficient" : 'abundant'
  end

  def self.aliquot_sum(num)
    get_divisors(num).reduce(:+)
  end

  private

  def self.get_divisors(num)
    divisors = [0]
    (1..Math.sqrt(num)).each do |n|
      if num % n == 0
        divisors << n
        divisors << num/n unless (n == 1) || (num/n) == n
      end
    end
    divisors
  end
end
