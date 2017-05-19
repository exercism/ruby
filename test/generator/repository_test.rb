require_relative '../test_helper'

module Generator
  class RepositoryTest < Minitest::Test
    def test_construction
      subject = Repository.new(paths: nil, slug: nil)
      assert_instance_of Repository, subject
    end
  end
end
