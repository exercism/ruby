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
      'test_%s' % canonical.description.strip.underscore
    end

    def skipped(index)
      index.zero? ? '# skip' : 'skip'
    end

    def method_missing(sym, *args, &block)
      return canonical.send(sym) if canonical.respond_to?(sym)
      super(sym, *args, &block)
    end

    def respond_to?(sym, include_private = false)
      canonical.respond_to?(sym) || super
    end

    protected

    def literal(number)
      number.underscore
    end

    def underscore(string)
      string.underscore
    end

    def camel_case(string)
      string.camel_case
    end

  end
end
