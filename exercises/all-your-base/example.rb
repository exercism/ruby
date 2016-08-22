module BookKeeping
  VERSION = 1
end

class BaseConverter
  def self.convert(base_from, number_array, base_to)
    return if number_array.any?{|number| number < 0 || number >= base_from}
    return if base_from <= 1 || base_to <= 1
    return [] unless number_array.any?
    number_in_canonical_base = convert_to_canonical_base(number_array, base_from)
    convert_from_canonical_base(number_in_canonical_base, base_to)
  end

  private
  def self.convert_to_canonical_base(number_array, base)
    total = 0
    number_array.reverse.each_with_index do |number, index|
      total += number * base ** index
    end
    total
  end

  def self.convert_from_canonical_base(number, base_to)
    result = []
    current_number = number
    while current_number >= base_to do
     result << current_number % base_to
     current_number = current_number / base_to
    end
    result << current_number % base_to
    result.reverse
  end
end
