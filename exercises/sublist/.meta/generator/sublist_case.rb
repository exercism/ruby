require 'generator/exercise_case'

class SublistCase < Generator::ExerciseCase
  def workload
    case expected
    when 'sublist'
      expect_sublist
    when 'superlist'
      expect_superlist
    when 'equal'
      expect_equal
    when 'unequal'
      expect_unequal
    end
  end

  def create_lists
    """l1 = List.new(#{listOne})
    l2 = List.new(#{listTwo})"""
  end

  def expect_sublist
    """#{create_lists}
    assert l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2"""
  end

  def expect_superlist
    """#{create_lists}
    refute l1.sublist?(l2)
    assert l1.superlist?(l2)
    refute l1 == l2"""
  end

  def expect_equal
    """#{create_lists}
    assert l1.sublist?(l2)
    assert l1.superlist?(l2)
    assert l1 == l2"""
  end

  def expect_unequal
    """#{create_lists}
    refute l1.sublist?(l2)
    refute l1.superlist?(l2)
    refute l1 == l2"""
  end
end
