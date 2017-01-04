require_relative '../test_helper'

module Generator
  class GitCommandTest < Minitest::Test
    def test_abbreviated_commit_hash
      assert_match(/^[0-9a-f]{7,}$/, GitCommand.abbreviated_commit_hash('./.git', 'test/generator_test.rb'))
    end
  end
end
