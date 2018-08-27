require 'ostruct'
require 'generator/exercise_case/assertion'
require 'generator/exercise_case/case_helpers'

module Generator
  class ExerciseCase
    include CaseHelpers
    include Assertion

    attr_reader :canonical
    def initialize(canonical:)
      @canonical = canonical
    end

    def name
      'test_%s' % canonical.description.strip.tr(' ', '_')
    end

    def skipped(index)
      index.zero? ? '# skip' : 'skip'
    end

    def workload
      fail StandardError, "You need to subclass and implement the 'workload' method"
    end

    def method_missing(sym, *args, &block)
      return canonical.send(sym) if canonical.respond_to?(sym)
      super(sym, *args, &block)
    end

    def respond_to?(sym, include_private = false)
      canonical.respond_to?(sym) || super
    end

    def error_expected?
      canonical.respond_to?(:expected_error)
    end
  end
end
