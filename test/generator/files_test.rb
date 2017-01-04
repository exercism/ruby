require_relative '../test_helper'

module Generator
  module Files
    class ReadableTest < Minitest::Test
      def test_abbreviated_commit_hash
        mock_git_command = Minitest::Mock.new.expect :call, nil, ['path/.git', 'subdir/file']
        subject = Readable.new(filename: 'path/subdir/file', repository_root: 'path')
        GitCommand.stub(:abbreviated_commit_hash, mock_git_command) do
          subject.abbreviated_commit_hash
        end
        mock_git_command.verify
      end
    end

    class WritableTest < Minitest::Test
      class TestWritableDoesntCallWrite < Writable
        private

        def write(_content)
          fail StandardError, 'write should not be called'
        end
      end

      def test_save_if_unchanged
        content = ''
        subject = TestWritableDoesntCallWrite.new(filename: '/dev/null')
        assert_equal(content, subject.save(content))
      end

      def test_save_if_changed
        mock_writer = Minitest::Mock.new
        content = 'new content'
        mock_writer.expect :write, content.size, [content]
        subject = Writable.new(filename: '/dev/null')
        File.stub :open, nil, mock_writer do
          assert_equal(content, subject.save(content))
        end
        mock_writer.verify
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
