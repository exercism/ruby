module BookKeeping
  VERSION = 2
end

class RunLengthEncoding
  def self.encode(str)
    str.chars.chunk { |char| char }.each_with_object('') do |chunk, out|
      out << encoded(chunk)
    end
  end

  def self.decode(str)
    str.scan(/(\d+)?(\D)/).each_with_object('') do |captures, out|
      out << decoded(captures)
    end
  end

  # private

  def self.encoded(chunk)
    char = chunk.first
    times = chunk.last.count
    return char if times == 1
    "#{times}#{char}"
  end
  private_class_method :encoded

  def self.decoded(captures)
    times = (captures.first || 1).to_i
    char = captures.last
    char * times
  end
  private_class_method :decoded
end
