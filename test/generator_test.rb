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
    assert_equal 'exercises/aname', subject.exercise_dir
  end

  def test_sha1
    expected = '1234567'
    GitCommand.stub :short_sha, expected do
      subject = Generator.new(nil, nil)
      assert_equal expected, subject.sha1
    end
  end
end
