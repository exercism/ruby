class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    @normalized ||= @plaintext.downcase.gsub(/\W/, '')
  end

  def plaintext_segments
    if size > 0
      normalize_plaintext.chars.
                          each_slice(size).
                          map{ |s| s.join('') }.
                          to_a
    else
      []
    end
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def ciphertext
    transposed.join(' ')
  end

  private 

  def transposed
    chunk_size = size
    chunks = plaintext_segments.map do |s|
        Array.new(chunk_size) { |i| s[i] or ' ' }
    end
    chunks.transpose.map{ |s| s.join('') }
  end
end

module BookKeeping
  VERSION = 1
end
