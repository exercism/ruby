require 'exercise_cases'

class EtlCase < OpenStruct
  def test_name
    'test_%s' % description.tr(' ,-', '_').downcase
  end

  def workload
    [
      "old = #{format_hash(integerize_keys(input))}",
      "    expected = #{format_hash(expected)}\n",
      indent(4, assertion),
    ].join("\n")
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def indent(size, text)
    text.lines.each_with_object('') { |line, obj| obj << ' ' * size + line }
  end

  def assertion
    "assert_equal expected, ETL.transform(old)"
  end

  def integerize_keys(input)
    input.reduce({}) { |hash, (k, v)| hash[k.to_i] = v; hash }
  end

  def format_hash(hash)
    middle = hash.each_pair.with_object('') do |(k, v), obj|
      value = v.class == Array ? v : "'#{v}'"
      obj << "      '#{k}' => #{value},\n "
    end
    "{\n #{middle}   }"
  end

end

EtlCases = proc do |data|
  JSON.parse(data)['transform']['cases'].map.with_index do |row, i|
    EtlCase.new(row.merge(index: i))
  end
end
