class DominoesCase < OpenStruct
  def test_name
    'test_%s' % description.gsub("can't", 'can not').gsub(/[= -]+/, '_')
  end

  def workload
    <<-WL.chomp
input_dominoes = #{input}
    output_chain = Dominoes.chain(input_dominoes)
    #{can_chain ? 'assert_correct_chain(input_dominoes, output_chain)' : 'assert_nil output_chain, "There should be no chain for #{input_dominoes}"'}
    WL
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end
end

DominoesCases = proc do |data|
  JSON.parse(data)['cases'].map.with_index do |row, i|
    DominoesCase.new(row.merge('index' => i))
  end
end
