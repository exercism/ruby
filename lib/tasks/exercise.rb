require 'json'
require 'rake'

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
    case @type
    when :practice
      File.join('.meta', "example.rb")
    when :concept
      File.join('.meta', "exemplar.rb")
    end
  end

  def testable_example_file
    config[:files][:solution][0]
  end

  def test_file
    config[:files][:test][0]
  end

  private
  def exercise_name
    @exercise_name ||= slug.tr('-', '_')
  end

  def config
    JSON.parse(File.read("#{directory}/.meta/config.json"), symbolize_names: true)
  end
end
