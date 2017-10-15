module BookKeeping
  VERSION = 1
end

class Crypto

  def initialize(plaintext)
    @plaintext = plaintext
  end

  def normalize_plaintext
    @normalized ||= @plaintext.downcase.gsub(/\W/, '')
  end

  def plaintext_segments
    return [] if normalize_plaintext == ''
    normalize_plaintext.chars.
                        each_slice(size).
                        map{ |s| s.join('') }.
                        to_a
  end

  def size
    Math.sqrt(normalize_plaintext.length).ceil
  end

  def ciphertext
    return '' if normalize_plaintext == ''
    transposed.join('')
  end

  def normalize_ciphertext
    transposed.join(' ')
  end

  private 

  def transposed
    chunk_size = size
    chunks = plaintext_segments.map do |s|
        Array.new(chunk_size) { |i| s[i] or '' }
    end
    chunks.transpose.map{ |s| s.join('') }
  end

end
