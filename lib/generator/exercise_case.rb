require 'ostruct'

module Generator
  class ExerciseCase
    using Generator::Underscore
    include CaseHelpers
    include Assertion

    attr_reader :case_data
    def initialize(case_data:)
      @case_data = case_data
    end

    def name
      'test_%s' % case_data['description'].underscore
    end

    def skipped(index)
      index.zero? ? '# skip' : 'skip'
    end
  end
end
