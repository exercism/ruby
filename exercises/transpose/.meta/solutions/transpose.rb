class Transpose
  def self.transpose(input)
    lines = input.split("\n")
    max_line_length = lines.map(&:length).max

    lines
      .map { |line| line.ljust(max_line_length).chars }
      .transpose.map(&:join).join("\n").strip
  end
end
