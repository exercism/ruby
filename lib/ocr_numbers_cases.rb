require 'exercise_cases'

class OcrNumbersCase < OpenStruct
  def name
    'test_%s' % description.downcase.tr('- .', '_')
  end

  def workload
    if expected == -1
      "assert_raises(ArgumentError) { #{test_case} }"
    else
      "assert_equal #{expected.inspect}, #{test_case}"
    end
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def test_case
    %Q(OcrNumbers.convert(#{(input.join("\n")).inspect}))
  end
end

OcrNumbersCases = proc do |data|
  JSON.parse(data)['cases'].flat_map {|section| section['cases'] }.
    map.with_index {|test, index| OcrNumbersCase.new(test.merge('index' => index)) }
end
