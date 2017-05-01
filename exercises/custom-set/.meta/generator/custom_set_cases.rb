require 'generator/exercise_cases'

class CustomSetCase < ExerciseCase

  def workload
    send property
  end

  private

  def union
    "set1 = CustomSet.new #{set1}
    set2 = CustomSet.new #{set2}
    expected = CustomSet.new #{expected}
    #{assert}_equal expected, set1.union(set2)"
  end

  def difference
    "set1 = CustomSet.new #{set1}
    set2 = CustomSet.new #{set2}
    expected = CustomSet.new #{expected}
    #{assert}_equal expected, set1.difference(set2)"
  end

  def intersection
    "set1 = CustomSet.new #{set1}
    set2 = CustomSet.new #{set2}
    expected = CustomSet.new #{expected}
    #{assert}_equal expected, set2.intersection(set1)"
  end

  def add
    "set = CustomSet.new #{set}
    expected = CustomSet.new #{expected}
    #{assert}_equal expected, set.add(#{element})"
  end

  def equal
    "set1 = CustomSet.new #{set1}
    set2 = CustomSet.new #{set2}
    #{assert}_equal set1, set2"
  end

  def disjoint
    "set1 = CustomSet.new #{set1}
    set2 = CustomSet.new #{set2}
    #{assert} set1.disjoint? set2"
  end

  def subset
    "set1 = CustomSet.new #{set1}
    set2 = CustomSet.new #{set2}
    #{assert} set1.subset? set2"
  end

  def empty
    "set = CustomSet.new #{set}
    #{assert}_empty set"
  end

  def contains
    "set = CustomSet.new #{set}
    element = #{element}
    #{assert} set.member? element"
  end

end
