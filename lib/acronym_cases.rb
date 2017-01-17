require 'exercise_cases'

class AcronymCase < OpenStruct
  def name
    'test_%s' % description.tr(' ', '_')
  end

  def assertion
    "Acronym.abbreviate('#{phrase}')"
  end

  def skipped?
    index > 0
  end
end

AcronymCases = proc do |data|
  JSON.parse(data)['abbreviate']['cases'].map.with_index do |row, i|
    AcronymCase.new(row.merge('index' => i))
  end
end
