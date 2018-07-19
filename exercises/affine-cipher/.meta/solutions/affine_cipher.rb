# encryption formula is E(x) = (a * x - b) % m
# decryption formula is D(E(x)) = a^-1(E(x) - b) % m

class Affine

attr_reader :key

  def initialize
    @alphabet = ('a'..'z').to_a
  end

  def addkey(a, b)

    @key = [a, b]; coprime_check(key[0])
    @cipherbet = make_cipherbet.join

  end

  def encode(string)
    clean_string(string).tr('a-z', @cipherbet).scan(/.{1,5}/).join(' ')
  end

  def decode(string)
    clean_string(string).tr(@cipherbet, 'a-z')
  end

  private
  def coprime_check(a)
    raise ArgumentError, "Error: a and m must be coprime!" if a.gcd(26) != 1
  end

  def make_cipherbet

    @alphabet.each_index.map do |index|
      encoded_index = (@key[0] * index + @key[1]) % 26
      @alphabet[encoded_index]
    end

  end

  def clean_string(string)
    string.downcase.tr('^0-9a-z', '')
  end

end
