class AlphaCase < Generator::ExerciseCase
  def name
    format('test_%s', canonical['description'].downcase.gsub(/[ -]/, '_'))
  end

  def workload
    "assert true"
  end
end
