require 'pathname'

module Generator
  module Files
    class Readable
      attr_reader :filename, :repository_root
      def initialize(filename:,repository_root: nil)
        @filename = filename
        @repository_root = repository_root
      end

      def to_s
        File.read(filename) if File.exist?(filename)
      end

      def abbreviated_commit_hash
        GitCommand.abbreviated_commit_hash(git_path, relative_filename)
      end

      private

      def relative_filename
        Pathname.new(filename).relative_path_from(Pathname.new(repository_root)).to_s
      end

      def git_path
        File.join(repository_root, '.git')
      end
    end

    class Writable < Readable
      def save_if_changed(new_content)
        save(new_content) unless new_content == to_s
        new_content
      end

      def save(new_content)
        File.open(filename, 'w') do |file|
          file.write new_content
        end
      end
    end

    # An Exercise is used as part of a Repository
    # so expects :paths and :exercise_name to be defined.
    module Exercise
      def paths
        fail NotImplementedError, 'Should return a Generator::Paths object'
      end

      def exercise_name
        fail NotImplementedError, 'Should return a String object'
      end
    end
  end
end
