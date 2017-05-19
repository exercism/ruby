module PhoneNumber
  NANP_PROTOCOL = %r{
    \A
    (?<international_code>1?)
    (?<area_code>[2-9]{1}[0-9]{2})
    (?<exchange_code>[2-9]{1}[0-9]{2})
    (?<subscriber>[0-9]{4})
    \z
  }x

  def self.clean(number)
    sanitized = digits_only(number)
    sections = nanp_parse(sanitized)
    format '%<area_code>s%<exchange_code>s%<subscriber>s', sections if sections
  end

  def self.digits_only(number)
    number.gsub(/\D/, '')
  end

  def self.nanp_parse(number)
    matches = number.match(NANP_PROTOCOL)
    matches.names.map(&:to_sym).zip(matches.captures).to_h if matches
  end
end

module BookKeeping
  VERSION = 2
end
