class RunLengthEncoding
  VERSION = 1

  def self.do(str)
    str.chars.chunk { |char| char }.each_with_object('') do |chunk, out|
      out << encode(chunk)
    end
  end

  def self.undo(str)
    str.scan(/(\d+)?(\D)/).each_with_object('') do |captures, out|
      out << decode(captures)
    end
  end

  def self.encode(chunk)
    char = chunk.first
    times = chunk.last.count
    return char if times == 1
    "#{times}#{char}"
  end
  private_class_method :encode

  def self.decode(captures)
    times = (captures.first || 1).to_i
    char = captures.last
    char * times
  end
  private_class_method :decode
end
