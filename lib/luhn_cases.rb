require 'exercise_cases'

class LuhnCase < OpenStruct
  def name
    'test_%s' % description.tr('- ', '__')
  end

  def workload
    %Q(#{assertion} Luhn.valid?(#{input.inspect}))
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def assertion
    expected ? 'assert' : 'refute'
  end
end

LuhnCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    LuhnCase.new(row.merge('index' => i))
  end
end
