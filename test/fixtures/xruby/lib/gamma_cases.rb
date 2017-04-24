class GammaCase < ExerciseCase

  def workload
    assert { Gamma.foo(bar) }
  end

end
