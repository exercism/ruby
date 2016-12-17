require_relative 'test_helper'

class GeneratorTest < Minitest::Test
  def test_default_metadata_path
    subject = Generator.new('aname', nil)
    # This is relative to the xruby root
    assert_equal '../x-common/exercises/aname', subject.metadata_dir
  end

  def test_initalize_with_fixture_path
    fixture_path = 'xruby/test/fixtures'
    subject = Generator.new('aname', nil, fixture_path)
    assert_equal 'xruby/test/fixtures/exercises/aname', subject.metadata_dir
  end

  def test_exercise_dir
    subject = Generator.new('aname', nil)
    # This is relative to the xruby root
    assert_equal './exercises/aname', subject.exercise_dir
  end

  def test_sha1
    expected = '1234567'
    GitCommand.stub :short_sha, expected do
      subject = Generator.new(nil, nil)
      assert_equal expected, subject.sha1
    end
  end

  def test_version
    metadata_repository_path = 'test/fixtures'
    exercises_path = 'test/fixtures'
    subject = Generator.new('alpha', nil, metadata_repository_path, exercises_path)
    expected = 1
    assert_equal expected, subject.version
  end

  def test_test_cases
    metadata_repository_path = 'test/fixtures/metadata'
    exercises_path = 'test/fixtures'
    canonical_data = File.read('test/fixtures/metadata/exercises/alpha/canonical-data.json')
    test_cases = Minitest::Mock.new
    test_cases.expect :call, true, [canonical_data]
    subject = Generator.new('alpha', test_cases, metadata_repository_path, exercises_path)
    subject.test_cases
    test_cases.verify
  end

  def test_generate
    metadata_repository_path = 'test/fixtures'
    exercises_path = 'test/fixtures'
    subject = Generator.new('alpha', nil, metadata_repository_path, exercises_path)
    assert subject.generate
    # TODO: test side effects
  end

  def test_generate_with_missing_metadata_repository
    metadata_repository_path = 'test/fixtures/nonexistant'
    exercises_path = 'test/fixtures'
    subject = Generator.new('alpha', nil, metadata_repository_path, exercises_path)
    assert_output '', /'x-common' repository not found/ do
      assert_raises Errno::ENOENT do
        subject.generate
      end
    end
    # TODO: test lack of side effects
  end
end

class GitCommandTest < Minitest::Test
  def test_short_sha
    assert_match(/^[0-9a-f]{7,}$/, GitCommand.short_sha('.'))
  end
end
