require 'ostruct'

module Generator
  class ExerciseCase < OpenStruct
    using Generator::Underscore
    include CaseHelpers
    include Assertion

    def name
      'test_%s' % description.underscore
    end

    def skipped(index)
      index.zero? ? '# skip' : 'skip'
    end
  end
end
