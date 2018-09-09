require 'generator/exercise_case'

class PangramCase < Generator::ExerciseCase
  def workload
    [
      "sentence = '#{sentence}'",
      "result = Pangram.pangram?(sentence)",
      assert_or_refute(expected, "result, \"#{message}\"")
    ]
  end

  def message
    "Expected #{expected}, got: \#{result.inspect}. \#{sentence.inspect} #{is_or_isnt} a pangram"
  end

  def is_or_isnt
    expected ? 'IS' : 'is NOT'
  end

  def description
    # Reword confusing test case name 
    # "e.g. 'h'" converts to "eg_h"
    super.gsub("another missing character, e.g. 'h'","missing character h")
  end
end
