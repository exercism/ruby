class AtbashCipher
  def self.encode(plaintext)
    new(plaintext).encode
  end

  def self.decode(ciphertext)
    new(ciphertext).decode
  end

  attr_reader :text

  def initialize(text)
    @text = text
  end

  def encode
    chunk convert(normalize(text))
  end

  def decode
    convert(normalize(text))
  end

  private

  def convert(s)
    s.tr(alphabet, key)
  end

  def chunk(s)
    s.scan(/.{1,5}/).join(' ')
  end

  def normalize(s)
    s.downcase.gsub(/[^a-z0-9]/, '')
  end

  def alphabet
    'abcdefghijklmnopqrstuvwxyz'
  end

  def key
    alphabet.reverse
  end
end
