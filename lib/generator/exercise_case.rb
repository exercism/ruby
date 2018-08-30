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

    def to_s(index)
      body = [
        skipped(index) + "\n",
        format_workload(workload)
      ].join

      method = [
        "def #{test_name}\n",
        indent_by(2, body),
        "end\n"
      ].join
      indent_by(2, method)
    end

    def test_name
      "test_#{clean_description}"
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

    def format_workload(workload)
      case workload
      when String
        workload.chomp + "\n"
      when Array
        workload.map { |line| line.chomp + "\n" }.join
      end
    end

    private

    def clean_description
      description = self.description.downcase.strip
      description.gsub!(/\W/, '_') # no non-word characters
      description.gsub!(/__*/, '_') # no multiple underscores
      description.sub!(/_*$/, '') # no trailing underscores
    end
  end
end
