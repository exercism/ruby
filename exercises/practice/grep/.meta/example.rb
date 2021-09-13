class Grep
  def self.grep(pattern, flags, files)
    matched_lines = []

    files.each do |file_name|
      file = open(file_name)

      file.each_line.map(&:chomp).each_with_index do |line, i|
        if match?(line, pattern, flags)
          matched_lines << [file_name, i + 1, line]
        end
      end
    end

    if flags.include?('-l')
      format_files(matched_lines)
    else
      format_lines(matched_lines, files, flags)
    end
  end

  def self.match?(line, pattern, flags)
    modifiers = 'i' if flags.include?('-i') # case-insensitive
    pattern = "^#{pattern}$" if flags.include?('-x') # match entire lines
    regex = Regexp.new(pattern, modifiers)

    return !regex.match?(line) if flags.include?('-v') # invert matching
    regex.match?(line)
  end

  def self.format_files(matched_lines)
    matched_lines.map do |file_name, _, _|
      file_name
    end.uniq.join("\n")
  end

  def self.format_lines(matched_lines, files, flags)
    result = []

    matched_lines.each do |file_name, line_number, line|
      line_result = ''
      line_result += file_name + ':' if files.size > 1
      line_result += line_number.to_s + ':' if flags.include?('-n')
      line_result += line

      result << line_result
    end

    result.join("\n")
  end
end
