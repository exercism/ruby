require 'exercise_cases'

class LuhnCase < OpenStruct
  def name
    'test_%s' % description.tr(' ', '_')
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end
