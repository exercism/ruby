class IsogramCase < OpenStruct
  def name
    str_to_ascii = input.downcase.unpack('U*').select { |c| c < 128 }.map(&:chr)
    joined_string = str_to_ascii.join.gsub(/[ -]/, '_')
    'test_%s' % joined_string
  end

  def do
    'Isogram.is_isogram?(str)'
  end

  def skipped?
    index > 0
  end
end

IsogramCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    IsogramCase.new(row.merge('index' => i))
  end
end
