require 'exercise_cases'

class PigLatinCase < OpenStruct
  def name
    'test_%s' % description.tr('- ', '__')
  end

  def workload
    %Q(assert_equal #{expected.inspect}, PigLatin.translate(#{input.inspect}))
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

PigLatinCases = proc do |data|
  JSON.parse(data)['cases'].
    flat_map {|section| section['cases'] }.
    each_with_index.
    reduce([]) {|cases, (test, i)| cases << PigLatinCase.new(test.merge('index' => i)) }
end
