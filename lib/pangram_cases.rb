require 'exercise_cases'

class PangramCase < OpenStruct
  def name
    'test_%s' % description.downcase.tr_s(" -'", '_').sub(/_$/, '')
  end

  def workload
    [
    "phrase = '#{input}'",
    "    result = Pangram.pangram?(phrase)",
    "    #{assertion} result, \"#{message}\""
    ].join("\n")
  end

  def message
    "Expected #{expected}, got: \#{result.inspect}. \#{phrase.inspect} #{is_or_isnt} a pangram"
  end

  def is_or_isnt
    expected ? 'IS' : 'is NOT'
  end

  def assertion
    expected ? 'assert' : 'refute'
  end

  def skipped?
    index.zero? ? '# skip' : 'skip'
  end
end

PangramCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    PangramCase.new(row.merge('index' => i))
  end
end
