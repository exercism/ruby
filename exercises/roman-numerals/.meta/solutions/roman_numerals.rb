class Integer
  ROMAN_MAPPINGS = 
   {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
    }

  def to_roman
    i = self
    s = ''
    ROMAN_MAPPINGS.each do |arabic, roman|
      while i >= arabic
        s << roman
        i -= arabic
      end
    end
    s
  end
end
