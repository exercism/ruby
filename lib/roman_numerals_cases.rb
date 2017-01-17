require 'exercise_cases'

class RomanNumeralsCase < OpenStruct
  def name
    'test_%s' % number.to_s
  end

  def do
    '%s.to_roman' % number.to_s
  end

  def skipped?
    index > 0
  end
end

RomanNumeralsCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    RomanNumeralsCase.new(row.merge('index' => i))
  end
end
