require 'exercise_cases'

class BeerSongCase < OpenStruct
  def test_name
    'test_%s' % description.tr(' ', '_')
  end

  def workload
    "BeerSong.new.%s(%s)" % [property, workload_arguments]
  end

  def expected
    self["expected"].gsub('\n', '"\n" \\')
  end

  def skipped
    index.zero? ? '# skip' : 'skip'
  end

  private

  def workload_arguments
    if property == 'verse'
      number
    else
      "%s, %s" % [self["beginning"], self["end"]]
    end
  end
end

BeerSongCases = proc do |data|
  i = 0
  cases = []
  JSON.parse(data)["cases"].each do |section|
    section["cases"].each do |tests|
      tests["cases"].each do |test|
        cases << BeerSongCase.new(test.merge('index' => i))
        i += 1
      end
    end
  end
  cases
end
