class AlphaCase < Generator::ExerciseCase
  def name
    format('test_%s', case_data['description'].downcase.gsub(/[ -]/, '_'))
  end

  def workload
    "assert true"
  end
end
