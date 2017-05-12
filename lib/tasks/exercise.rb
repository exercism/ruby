class Exercise
  class << self
    def all
      slugs.map { |e| new(e) }
    end

    private

    def slugs
      FileList['exercises/*'].pathmap('%f').exclude('TRACK_HINTS.md')
    end
  end

  attr_reader :slug
  alias :to_s :slug

  def initialize(slug)
    @slug = slug
  end

  def directory
    "exercises/#{slug}/."
  end

  def example_file
    File.join('.meta', 'solutions', "#{exercise_name}.rb")
  end

  def testable_example_file
    "#{exercise_name}.rb"
  end

  def test_file
    "#{exercise_name}_test.rb"
  end

  private

  def exercise_name
    @exercise_name ||= slug.tr('-', '_')
  end
end
