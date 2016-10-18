class ClockCase < OpenStruct
  def test_name
    'test_%s' % description
                .gsub(/[() -]/, '_')
                .gsub('=', 'is_equal_to')
                .chomp('_')
  end

  def work_load
    section == 'equal' ? compare_clocks : simple_test
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def compare_clocks
    "clock1 = Clock.at(#{clock1['hour']}, #{clock1['minute']})
    clock2 = Clock.at(#{clock2['hour']}, #{clock2['minute']})
    #{assert_or_refute} clock1 == clock2"
  end

  def simple_test
    [
      "assert_equal #{expected.inspect}, ",
      "#{'(' if add_to_clock}Clock.at(#{hour}, ",
      "#{minute})#{add_to_clock}#{')' if add_to_clock}.to_s"
    ].join
  end

  def assert_or_refute
    expected ? 'assert' : 'refute'
  end

  def add_to_clock
    " + #{add}" if add
  end
end

ClockCases = proc do |data|
  i = 0
  json = JSON.parse(data)
  cases = []
  %w(create add equal).each do |section|
    json[section]['cases'].each do |row|
      row = row.merge(row.merge('index' => i, 'section' => section))
      cases << ClockCase.new(row)
      i += 1
    end
  end
  cases
end
