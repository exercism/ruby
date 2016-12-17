require_relative '../test_helper'

module Generator
  module Files
    class ReadableTest < Minitest::Test
      def test_abbreviated_commit_hash
        mock_git_command = Minitest::Mock.new.expect :call, nil, ['path/.git','subdir/file']
        subject = Readable.new(filename: 'path/subdir/file', repository_root: 'path')
        GitCommand.stub(:abbreviated_commit_hash, mock_git_command) do
          subject.abbreviated_commit_hash
        end
        mock_git_command.verify
      end
    end

    class WritableTest < Minitest::Test
      class TestUnchangedWritable < Writable
        def save(_new_content)
          fail StandardError
        end
      end

      def test_save_if_changed_unchanged
        new_content = ''
        subject = TestUnchangedWritable.new(filename: '/dev/null')
        assert_equal(new_content, subject.save_if_changed(new_content))
      end

      class TestChangedWritable < Writable
        def save(_new_content)
        end
      end

      def test_save_if_changed
        new_content = 'new content'
        subject = TestChangedWritable.new(filename: '/dev/null')
        assert_equal(new_content, subject.save_if_changed(new_content))
      end

      def test_save
        new_content = 'new content.'
        subject = Writable.new(filename: '/dev/null')
        assert_equal 12, subject.save(new_content)
      end
    end

    class ExerciseTest < Minitest::Test
      class TestNotImplementedTrackFiles
        include Exercise
      end

      def test_paths_not_implemented
        subject = TestNotImplementedTrackFiles.new
        assert_raises NotImplementedError do
          subject.paths
        end
      end

      def test_exercise_name_not_implemented
        subject = TestNotImplementedTrackFiles.new
        assert_raises NotImplementedError do
          subject.exercise_name
        end
      end
    end
  end
end
