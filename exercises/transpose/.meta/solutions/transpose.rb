class Transpose
  def self.transpose(input)
    lines = input.split("\n")
    longest = lines.map(&:length).max || 0

    padding_array = [nil] * longest
    equal_length_arrays = lines.map { |line| (line.chars + padding_array).take(longest) }
    # Transpose.
    transposed = equal_length_arrays.transpose
    # strip trailing nils (remove right padding)
    no_trailing_nils = transposed.map { |row| row.reverse.drop_while(&:nil?).reverse }
    # replace remaining nils with spaces (add left padding)
    correctly_padded = no_trailing_nils.map { |row| row.map { |c| c.nil? ? ' ' : c } }
    # turn it back into a string
    correctly_padded.map(&:join).join("\n")
  end
end
