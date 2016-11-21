class QueenCase < OpenStruct
  def test_name
    "test_#{description.gsub(/[ ]/, '_')}"
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  def parse_position queen
    queen['position'].delete('() ').split(',').map{|i| i.to_i}
  end
end

class QueenAttackCase < QueenCase
  def workload
    """queens = Queens.new white: #{parse_position white_queen}, black: #{parse_position black_queen}
    #{assertion} queens.attack?"""
  end

  def assertion
    expected ? 'assert' : 'refute'
  end
end

class QueenCreateCase < QueenCase
  def workload
    expected == -1 ? exception : input
  end

  def input
    "Queens.new white: #{parse_position queen}"
  end

  def exception
    """assert_raises ArgumentError do
      #{input}
    end"""
  end
end

TYPES = [
  ['create', QueenCreateCase],
  ['can_attack', QueenAttackCase]
]

QueenAttackCases = proc do |data|
  json = JSON.parse data
  TYPES.flat_map.with_index do |(type, caseClass), i|
    json[type]['cases'].map.with_index do |row, j|
      caseClass.new row.merge('index' => i+j)
    end
  end
end
