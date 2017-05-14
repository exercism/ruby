require_relative '../test_helper'

module Generator
  class RepositoryTest < Minitest::Test
    FixturePaths = Paths.new(
      metadata: 'test/fixtures/metadata',
      track: 'test/fixtures/xruby'
    )

    def test_slug
      subject = Repository.new(paths: FixturePaths, slug: 'alpha')
      assert_equal 'alpha', subject.slug
    end

    def test_name
      subject = Repository.new(paths: FixturePaths, slug: 'alpha-beta')
      assert_equal 'alpha_beta', subject.name
    end
  end
end
