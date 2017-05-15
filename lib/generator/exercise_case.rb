require 'ostruct'

module Generator
  class ExerciseCase
    using Generator::Underscore
    include CaseHelpers
    include Assertion

    attr_reader :canonical
    def initialize(canonical:)
      @canonical = canonical
      setup_forwards(canonical)
    end

    def name
      'test_%s' % canonical.description.underscore
    end

    def skipped(index)
      index.zero? ? '# skip' : 'skip'
    end

    private

    def setup_forwards(data)
      data.to_h.keys.each do |key|
        send(:define_singleton_method, key) { forward(key) }
      end
    end

    def forward(key)
      canonical.send(key)
    end
  end
end
