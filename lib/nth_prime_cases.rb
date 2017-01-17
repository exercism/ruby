require 'exercise_cases'

class NthPrimeCase < OpenStruct
  def name
    'test_%s' % description.downcase.gsub(/[ -]/, '_')
  end

  def actual
    "Prime.nth(#{input})"
  end

  def raises_error?
    expected == false
  end

  def skipped?
    index > 0
  end
end

NthPrimeCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    NthPrimeCase.new(row.merge('index' => i))
  end
end
