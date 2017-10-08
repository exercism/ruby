require 'generator/exercise_case'

class FlattenArrayCase < Generator::ExerciseCase

  def workload
    declaration = "fa = FlattenArray.flatten(#{canonical.input})"
    assertion = "assert_equal #{canonical.expected}, fa"
    indent_lines([declaration, assertion], 4)
  end

end
