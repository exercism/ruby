class Exercise
  class << self
    def all
      concept + practice
    end

    def concept
      concept_slugs.map { |e| new(e, :concept) }
    end

    def practice
      practice_slugs.map { |e| new(e, :practice) }
    end

    def concept_slugs
      FileList['exercises/concept/*'].pathmap('%f')
    end

    def practice_slugs
      FileList['exercises/practice/*'].pathmap('%f')
    end
  end

  attr_reader :slug, :type
  alias to_s slug

  def initialize(slug, type)
    @slug = slug
    @type = type
  end

  def directory
    "exercises/#{type}/#{slug}/."
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
