require 'ostruct'

module Generator
  class ExerciseCase
    using Generator::Underscore
    include CaseHelpers
    include Assertion

    attr_reader :canonical
    def initialize(canonical:)
      @canonical = canonical
    end

    def name
      'test_%s' % canonical.description.underscore
    end

    def skipped(index)
      index.zero? ? '# skip' : 'skip'
    end

    def method_missing(sym, *args, &block)
      return canonical.send(sym) if canonical.respond_to?(sym)
      super(sym, *args, &block)
    end
  end
end
