class Exercise
  class << self
    def all
      exercise_names.map { |e| new(e) }
    end

    private

    def exercise_names
      FileList['exercises/*'].pathmap('%f').exclude('TRACK_HINTS.md')
    end
  end

  attr_reader :name
  alias :to_s :name

  def initialize(name)
    @name = name
  end

  def directory
    "exercises/#{name}/."
  end

  def example_file
    'example.rb'
  end

  def testable_example_file
    "#{base_file_name}.rb"
  end

  def test_file
    "#{base_file_name}_test.rb"
  end

  private

  def base_file_name
    @_base_file_name ||= name.tr('-', '_')
  end
end
