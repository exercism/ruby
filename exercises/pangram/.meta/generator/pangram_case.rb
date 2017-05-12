require 'generator/exercise_case'

class PangramCase < Generator::ExerciseCase
  def workload
    [
    "phrase = '#{input}'",
    "    result = Pangram.pangram?(phrase)",
    "    #{assert} result, \"#{message}\""
    ].join("\n")
  end

  def message
    "Expected #{expected}, got: \#{result.inspect}. \#{phrase.inspect} #{is_or_isnt} a pangram"
  end

  def is_or_isnt
    expected ? 'IS' : 'is NOT'
  end

end
