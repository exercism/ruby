class PigLatinCase < ExerciseCase
  def workload
    assert_equal { "PigLatin.translate(#{input.inspect})" }
  end
end

PigLatinCases = proc do |data|
  JSON.parse(data)['cases'].flat_map {|section| section['cases'] }. # extract all the cases into a single array
    map.with_index { |test, index| PigLatinCase.new(test.merge('index' => index)) }
end
