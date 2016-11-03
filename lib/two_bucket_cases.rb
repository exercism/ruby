class TwoBucketCase < OpenStruct
  def test_name
    "test_bucket_one_#{bucket_one}_bucket_two_"\
    "#{bucket_two}_goal_#{goal}_starting_#{start_bucket}"
  end

  def do
    "TwoBucket.new(#{bucket_one}, #{bucket_two}, #{goal}, '#{start_bucket}')"
  end

  def workload
    "two_bucket = #{self.do}
    assert_equal #{expected['moves']}, two_bucket.moves
    assert_equal '#{expected['goal_bucket']}', two_bucket.goal_bucket
    assert_equal #{expected['other_bucket']}, two_bucket.other_bucket"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

TwoBucketCases = proc do |data|
  JSON.parse(data)['two_bucket']['cases'].map.with_index do |row, i|
    row = row.merge('index' => i)
    TwoBucketCase.new(row)
  end
end
